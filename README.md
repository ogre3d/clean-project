# clean-project
[![Travis build status](https://travis-ci.org/ogre3d/clean-project.svg?branch=master)](https://travis-ci.org/ogre3d/clean-project) [![build status](https://gitlab.com/ci/projects/17554/status.png?ref=master)](https://gitlab.com/ci/projects/17554?ref=master)

A clean ogre project with cmake.

### Features
- It compiles on GNU/Linux and Windows.
- It is shipped with continuous integration build script for [Gitlab CI](https://about.gitlab.com/gitlab-ci/) and [Travis](https://travis-ci.org/).
- It is compatible with OGRE version: `1.7`, `1.8` and `1.9`.


### Roadmap
- Ogre 2.0 and 2.1 support.
- Travis Ubuntu 14.04 support.
- Travis Mac support.
- Android build.
- Mingw cross-compilation support (build 32bits from 64bits and vice versa).
- Mingw Windows build.
- Maybe some unit tests?

### Build
```bash
mkdir build
cd build
cmake ..
make
make install
```
