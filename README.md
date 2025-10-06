# docker-wraps-git-module
Implements module git for docker wraps environment.

## Usage
Add `docker-wraps-git-module` to as submodule to your project:
```bash
git submodule add https://github.com/RomaTk/docker-wraps-git-module.git modules/<name-you-like>
```

## Wraps:
After that you will have the following wraps available:
- `git-get-latest-version`
- `git-download`
- `git-download-with-configs`
- `git-install`

You can specify which version of git you want to use by modifying `build.run.before` in `git-install` wrap. Within:
```bash
source ./env-scripts/git/install/prepare-before-build.sh && main "<VERSION>" "linux" "./dockers/git"
```
if no version is specified, latest stable version will be used.

## Requirements

To use you need to have modules:
- https://github.com/RomaTk/docker-wraps-backups-module.git
    - This module will allow to avoid rebuilding images if they are already built.
- https://github.com/RomaTk/docker-wraps-ubuntu-module.git
    - This module will allow to have ubuntu image as base for git images.
- https://github.com/RomaTk/docker-wraps-install-some-util-module.git
    - This module will provide env-scripts for common way to install some utils in the docker wraps environment.

