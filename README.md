#  CodePad: a simple iOS code editor

[![GitHub license](https://img.shields.io/github/license/sohnryang/CodePad)](https://github.com/sohnryang/CodePad/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/sohnryang/CodePad)](https://github.com/sohnryang/CodePad/issues)
[![Build Status](https://travis-ci.com/sohnryang/CodePad.svg?branch=master)](https://travis-ci.com/sohnryang/CodePad)
[![codecov](https://codecov.io/gh/sohnryang/CodePad/branch/master/graph/badge.svg)](https://codecov.io/gh/sohnryang/CodePad)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)

## What?

CodePad is a simple code editor for iOS. It is currently work-in-progress.

## Features and Roadmap

### `P0`: Bare Minimum, should be implemented by `v0.1.0`
- [x] Code editing and saving
- [x] File creation
- [x] Syntax highlighting
- [x] Filetype detection for syntax highlighting
- [ ] Configuration menus
- [ ] Start beta testing

### `P0.5`: Not necessary, but needed for long-term maintenance
- [x] Proper logging
- [x] Unit tests
- [x] UI automation tests
- [x] CI using TravisCI/GitHub Actions

### `P1`: Important Features, should be implemented by `v0.2.0`
- [ ] Share menu
- [ ] Custom keyboard for better code editing
- [ ] Code completion
- [ ] Running code using online compiler APIs

### `P2`: Auxiliary Features, can be implemented after `v1.0.0`
- [ ] Support for iPad
- [ ] Running code natively on device
- [ ] Semantic code completion
- [ ] Keyboard shortcuts for external keyboards
- [ ] Export/Publish code...
  - [ ] ... to GitHub repos
  - [ ] ... as GitHub Gist
  - [ ] ... as image (using something like [carbon.now.sh](https://carbon.now.sh/))
