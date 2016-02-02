# sh-utils #

[![build status](https://travis-ci.org/uxcn/sh-utils.svg?branch=master)](https://travis-ci.org/uxcn/sh-utils)
[![python versions](https://img.shields.io/pypi/pyversions/sh-utils.svg)](https://pypi.python.org/pypi/sh-utils)
[![license](https://img.shields.io/pypi/l/sh-utils.svg)](http://opensource.org/licenses/MIT)
[![pypi downloads](https://img.shields.io/pypi/dm/sh-utils.svg)](https://pypi.python.org/pypi/sh-utils)
[![issues](https://img.shields.io/github/issues/uxcn/sh-utils.svg)](https://github.com/uxcn/sh-utils/issues)

Some commands to simplify various things.

* pm - move p to p'
* cpm - copy p to p'
* upm - undo p to p'
* sw - swap two paths
* pt - pivot file over a command
* pts - pivot file over a command (stdin)

These commands simplify some common tasks in a shell.

For example, it's often helpful to copy a file to a backup.

    jason@io ~ cp foo foo\'

Instead, the `cpm` command is a bit more flexible and less to type.

    jason@io ~ cpm foo

The `pm` commands, in general, can also be used en masse.

    jason@io ~ cpm *

Another common pattern is running a command on a file and replacing it with the output,
which `pt` supports.

    jason@io ~ pt sort foo

The `pts` command is also similar to `pt`, but allows for some more complex
combinations.

    jason@io ~ pts sh -c "sort | awk '{ print \$1, \$2 * \$2 }'" foo

Any issues or bug reports, please use the github issue
[tracker](https://github.com/uxcn/sh-utils/issues).  Pull requests and patches
are also welcome.

## Aliases ##

Some useful aliases to avoid prompts and change the default suffix.

    alias pm="pm -f -s .old"
    alias cpm="cpm -f -s .old"
    alias upm="upm -f -s .old"

## Installing ##

### PyPI ###

    pip install sh-utils

### From source ###

    python setup.py install

## Versions ##

0.9 (Feb, 2016)

* first release
