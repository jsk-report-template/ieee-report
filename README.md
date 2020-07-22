# ieee-report

Latex template for IEEE Conference (Paper Plaza)

based on http://ras.papercept.net/conferences/support/tex.php

[![Build Status](https://travis-ci.org/jsk-report-template/ieee-report.svg?branch=master)](https://travis-ci.org/jsk-report-template/ieee-report)

### 1. Edit LaTeX files

### 2. Make pdf

```bash
$ make
```

### 3. Release pdf

- Install [Travis Command Line Tool](https://github.com/travis-ci/travis.rb#installation)
- Enable Travis

  ```bash
  travis enable
  travis setup releases --force
  ```

- After `travis` command, configuration like below will be appended to `.travis.yml`.

  ```yaml
  deploy:
    provider: releases
    api_key: "GITHUB OAUTH TOKEN"
    file: main.pdf
    skip_cleanup: true
    on:
      tags: true
  ```

**NOTE** Please make sure you have `skip_cleanup` and `on: tags` is `true`


- Push your tag by `git push --tags`. Then you can watch pdf in github releases.

### Optional. cleaning

```bash
$ make clean
# or
$ make wipe
```
