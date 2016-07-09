# clean-project
[![Travis build status](https://travis-ci.org/ogre3d/clean-project.svg?branch=master)](https://travis-ci.org/ogre3d/clean-project) [![build status](https://gitlab.com/ci/projects/17554/status.png?ref=master)](https://gitlab.com/ci/projects/17554?ref=master)

A clean ogre project with cmake. It aims to be a start for Ogre based projects and to compile on as much different environment as possible.

### Features

         | Travis Ubuntu 12.04 | Travis Ubuntu 14.04 | Gitlab CI Debian Jessie
---------|---------------------|---------------------|------------------------
Ogre 1.9 | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:
Ogre 1.8 | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:
Ogre 1.7 | :heavy_check_mark:  | :x:                 | :x:

### Roadmap
- Ogre 2.0 and 2.1 support.
- Travis Mac support.
- Appveyor support.
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

### Contributions
... are highly welcomed!
