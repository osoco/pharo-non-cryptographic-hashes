# pharo-non-cryptographic-hashes

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

