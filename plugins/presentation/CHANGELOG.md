# Changelog

## [2.0.0](https://github.com/KingOfKalk/agent-plugins/compare/presentation--v1.0.0...presentation--v2.0.0) (2026-11-07)


### ⚠ BREAKING CHANGES

* **presentation:** presentation-designer no longer builds slides itself; it writes spec.md and hands off to presentation-builder.
* **presentation:** the plugins presentation-drafter and presentation-designer are removed from the marketplace. Uninstall them and install presentation@kingofkalk-plugins instead. Skill invocations change to `/presentation:presentation-drafter` and `/presentation:presentation-designer`.

### Features

* **presentation:** add a styleguide deck to the designer ([#96](https://github.com/KingOfKalk/agent-plugins/issues/96)) ([35702fd](https://github.com/KingOfKalk/agent-plugins/commit/35702fd1622a3439fa3d764e9230d633cbd11f2c)), closes [#92](https://github.com/KingOfKalk/agent-plugins/issues/92)
* **presentation:** add closing contributions slide and last-slide rule ([#86](https://github.com/KingOfKalk/agent-plugins/issues/86)) ([5768457](https://github.com/KingOfKalk/agent-plugins/commit/576845702933ab888810b7c322e9591868cdc6b8))
* **presentation:** build rules per format and designer review workflow ([#87](https://github.com/KingOfKalk/agent-plugins/issues/87)) ([d8fe4cc](https://github.com/KingOfKalk/agent-plugins/commit/d8fe4cc326ccfad7a49500fb6f254d3e92065ffd))
* **presentation:** define type style rules ([#85](https://github.com/KingOfKalk/agent-plugins/issues/85)) ([3685c58](https://github.com/KingOfKalk/agent-plugins/commit/3685c5818eeb8902d221489e0a38ab839cad4775))
* **presentation:** extend the deck layout check to grid, type and color ([#94](https://github.com/KingOfKalk/agent-plugins/issues/94)) ([1828a84](https://github.com/KingOfKalk/agent-plugins/commit/1828a84e170ba53bab434efc75a9b0bea2297a13)), closes [#90](https://github.com/KingOfKalk/agent-plugins/issues/90)
* **presentation:** merge presentation-drafter and presentation-designer into one plugin ([fc9823e](https://github.com/KingOfKalk/agent-plugins/commit/fc9823e8737a05feaa172493d8e426c743dc66af))
* **presentation:** settle design details and use pure white background ([#89](https://github.com/KingOfKalk/agent-plugins/issues/89)) ([43d3e47](https://github.com/KingOfKalk/agent-plugins/commit/43d3e47d2bbf89c8e915a6b829fc1a22270b1bbd))
* **presentation:** split into drafter, designer and builder ([#82](https://github.com/KingOfKalk/agent-plugins/issues/82)) ([e3d7e0d](https://github.com/KingOfKalk/agent-plugins/commit/e3d7e0d6955b5b0d656e86f0aaaa39558012135f))


### Bug Fixes

* **presentation:** add missing template components and spec align field ([#84](https://github.com/KingOfKalk/agent-plugins/issues/84)) ([75b05c2](https://github.com/KingOfKalk/agent-plugins/commit/75b05c2980df5ec638473e2b7f4704bef96c2bf4))
* **presentation:** use neutral light grays ([#93](https://github.com/KingOfKalk/agent-plugins/issues/93)) ([62b5481](https://github.com/KingOfKalk/agent-plugins/commit/62b54819e29a7e35fefafb6daaca9086d79c2b06))


### Refactoring

* **presentation:** cut designer reference size ([#88](https://github.com/KingOfKalk/agent-plugins/issues/88)) ([a8707b2](https://github.com/KingOfKalk/agent-plugins/commit/a8707b282f9aa1ceec0e173ab7214ca9d385a25f)), closes [#76](https://github.com/KingOfKalk/agent-plugins/issues/76)


### Documentation

* **presentation:** use subheadline in examples outside the title slide ([#91](https://github.com/KingOfKalk/agent-plugins/issues/91)) ([46bc981](https://github.com/KingOfKalk/agent-plugins/commit/46bc981fc16cca73dbd67ad478221b96b08d0e48)), closes [#76](https://github.com/KingOfKalk/agent-plugins/issues/76)
