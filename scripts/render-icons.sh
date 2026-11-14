#!/usr/bin/env bash
# Renders the plugin icons: assets/icons/<plugin>.svg (the sources, one shared
# palette) to plugins/<plugin>/.claude-plugin/icon.png (512x512), the path
# `claude plugin validate` looks for. Run it after changing an SVG and commit
# both files. Not part of CI.
# Needs Docker: Chromium runs in the official Playwright image, pinned below.
# PREVIEW=<file.png> also writes a contact sheet of all icons at 64 px.
# Run from anywhere: scripts/render-icons.sh
set -euo pipefail
cd "$(dirname "$0")/.."

PLAYWRIGHT_VERSION=1.65.1
IMAGE=mcr.microsoft.com/playwright:v${PLAYWRIGHT_VERSION}-noble

preview=${PREVIEW:-}
preview_mount=()
if [ -n "$preview" ]; then
  mkdir -p "$(dirname "$preview")"
  preview=$(cd "$(dirname "$preview")" && pwd)/$(basename "$preview")
  preview_mount=(-v "$(dirname "$preview")":"$(dirname "$preview")")
fi

docker run --rm -i --user "$(id -u):$(id -g)" -e HOME=/tmp \
  -e PREVIEW="$preview" -e PLAYWRIGHT_VERSION="$PLAYWRIGHT_VERSION" \
  -v "$PWD":"$PWD" -w "$PWD" "${preview_mount[@]}" "$IMAGE" \
  bash -c 'npm install --silent --no-fund --no-audit --prefix /tmp/pw "playwright@$PLAYWRIGHT_VERSION" \
    && NODE_PATH=/tmp/pw/node_modules node -' <<'JS'
const fs = require('fs');
const path = require('path');
const { chromium } = require('playwright');

(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage({ viewport: { width: 512, height: 512 } });
  const names = fs.readdirSync('assets/icons').filter((f) => f.endsWith('.svg')).sort();
  const pngs = [];
  for (const file of names) {
    const plugin = path.basename(file, '.svg');
    const dir = path.join('plugins', plugin, '.claude-plugin');
    if (!fs.existsSync(dir)) throw new Error(`no plugin for assets/icons/${file}`);
    const svg = fs.readFileSync(path.join('assets/icons', file), 'utf8');
    await page.setContent(`<style>html,body{margin:0;background:transparent}</style>${svg}`);
    const out = path.join(dir, 'icon.png');
    await page.locator('svg').screenshot({ path: out, omitBackground: true });
    pngs.push(out);
    console.log(`${out}: ${fs.statSync(out).size} bytes`);
  }
  if (process.env.PREVIEW) {
    const imgs = pngs
      .map((p) => `<img width="64" height="64" src="data:image/png;base64,${fs.readFileSync(p).toString('base64')}">`)
      .join('');
    const sheet = await browser.newPage({ viewport: { width: 16 + pngs.length * 80, height: 96 } });
    await sheet.setContent(`<body style="margin:0;padding:16px;display:flex;gap:16px;background:#fff">${imgs}</body>`);
    await sheet.screenshot({ path: process.env.PREVIEW });
    console.log(`preview: ${process.env.PREVIEW}`);
  }
  await browser.close();
})().catch((e) => {
  console.error(e);
  process.exit(1);
});
JS
