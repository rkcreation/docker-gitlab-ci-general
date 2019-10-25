# Docker Gitlab CI general

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/rkcreation/gitlab-ci-general?style=for-the-badge) ![Docker Pulls](https://img.shields.io/docker/pulls/rkcreation/gitlab-ci-general?style=for-the-badge) ![Docker Stars](https://img.shields.io/docker/stars/rkcreation/gitlab-ci-general?style=for-the-badge) ![GitHub stars](https://img.shields.io/github/stars/rkcreation/docker-gitlab-ci-general?label=GitHub%20Stars&style=for-the-badge) ![GitHub last commit](https://img.shields.io/github/last-commit/rkcreation/docker-gitlab-ci-general?style=for-the-badge)

Docker image for general purpose, based on PHP 7 stretch official image, with extra tools.

## Command-line tools

* curl
* wget
* rsync
* sshpass (SSH authentication with password for CI/CD)
* gnupg

## JS tools

* node v12
* npm v6
* yarn
* gulp
* release-it

## PHP tools

* Composer

## Usage

Use it in `.gitlab-ci.yml` :

```yaml
image: rkcreation/gitlab-ci-general:latest
```