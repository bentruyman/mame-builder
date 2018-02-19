# mame-builder

> Docker image for compiling MAME binaries

This Docker image, based on Ubuntu 16.04, is capable of compiling a 64-bit
MAME binary for use on Linux-based systems.

## Usage

### Building the image

To build this image, all that's needed is to run the default `make` task:

```sh
$ make
```

### Compiling MAME

To compile a MAME binary, run the image providing a `$MAME_VERSION`
environment variable corresponding to the tag or branch of the official
[MAME](https://github.com/mamedev/mame/) repository:

```sh
$ MAME_VERSION=mame0194 make compile
```

Using the above command, once completed, a new `mame64` binary will be
available within a `build` directory in the root of this repository.

For more control, `docker run` can also be used to compile the binary:

```sh
$ docker run --rm -it \
    -e MAME_VERSION=mame0194 \
    -v $(pwd)/build:/workspace \
    bentruyman/mame-builder
```

### Debugging the image

To enter the image rather than compile a new binary, specify an executable such as `sh` or `bash` to override the default entrypoint behavior:

```sh
$ docker run --rm -it bentruyman/mame-builder sh
```

# License

MIT License

Copyright (c) 2018 Ben Truyman

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
