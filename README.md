# pharo-non-cryptographic-hashes


[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/osoco/pharo-non-cryptographic-hashes.svg?branch=master)](https://travis-ci.org/osoco/pharo-non-cryptographic-hashes)
[![Coverage Status](https://coveralls.io/repos/github/osoco/pharo-non-cryptographic-hashes/badge.svg?branch=master)](https://coveralls.io/github/osoco/pharo-non-cryptographic-hashes?branch=master)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/osoco/PharoPDS/master/LICENSE)

Collection of non-cryptographic hash functions for Pharo Smalltalk.

It includes the following hash functions:

  * MurmurHash3 32-bits x86 variant.
  * MurmurHash3 128-bits x64 variant.

## Installation

To install `pharo-non-cryptographic-hashes` on your Pharo image you can just find it in the **Pharo Project Catalog** (`World menu` > `Tools` > `Catalog Browser`) and click in the *green mark* icon in the upper right corner to install the latest stable version.

Or, you can also execute the following script:

```Smalltalk
    Metacello new
      baseline: #NonCryptographicHashes;
    	repository: 'github://osoco/pharo-non-cryptographic-hashes:master/src';
    	load
```

To add this project to your own project's baseline just add this:

```Smalltalk
    spec
    	baseline: #NonCryptographicHashes
    	with: [ spec repository: 'github://osoco/pharo-non-cryptographic-hashes:master/src' ]
```

Note that you can replace the *master* by another branch or a tag.

## License

This project is written and supported by developers at **[OSOCO](https://osococo.es)** and published as **free and open source** software  under an **[MIT license](LICENSE)**.

