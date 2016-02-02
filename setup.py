from distutils.core import setup

setup(
        url                 = 'https://github.com/uxcn/sh-utils',
        name                = 'sh-utils',
        version             = '0.9',
        fullname            = 'sh-utils',
        description         = 'some commands to simplify various things',
        long_description    = '''
sh-utils

Some commands to simplify various things.

* pm - move p to p'
* cpm - copy p to p'
* upm - undo p to p'
* sw - swap two paths
* pt - pivot file over a command
* pts - pivot file over a command (stdin)

These commands simplify some common tasks in a shell.

For example, it's often helpful to copy a file to a backup.
::

    jason@io ~ cp foo foo\\'

Instead, the `cpm` command is a bit more flexible and less to type.
::

    jason@io ~ cpm foo

The `pm` commands, in general, can also be used en masse.
::

    jason@io ~ cpm *

Another common pattern is running a command on a file and replacing it with the output,
which `pt` supports.
::

    jason@io ~ pt sort foo

The `pts` command is also similar to `pt`, but allows for some more complex
combinations.
::

    jason@io ~ pts sh -c "sort | awk '{ print \$1, \$2 * \$2 }'" foo

Any issues or bug reports, please use the github issue
`tracker <https://github.com/uxcn/sh-utils/issues>`_.  Pull requests and patches
are also welcome.

Aliases
-------

Some useful aliases to avoid prompts and change the default suffix.
::

    alias pm="pm -f -s .old"
    alias cpm="cpm -f -s .old"
    alias upm="upm -f -s .old"


Installing
----------

PyPI

    pip install sh-utils

From source

    python setup.py install

Versions
--------

0.9 (Feb, 2016)

* first release
''',
        classifiers         = ['Development Status :: 4 - Beta',
                               'Environment :: Console',
                               'Intended Audience :: Developers',
                               'Intended Audience :: System Administrators',
                               'Topic :: System :: Archiving',
                               'Topic :: System :: Archiving :: Backup',
                               'Topic :: Software Development',
                               'Topic :: System :: Filesystems',
                               'Topic :: System :: Shells',
                               'Topic :: System :: System Shells',
                               'Natural Language :: English',
                               'Operating System :: OS Independent',
                               'Programming Language :: Python',
                               'Programming Language :: Python :: 2',
                               'Programming Language :: Python :: 2.7',
                               'Programming Language :: Python :: 3',
                               'Programming Language :: Python :: 3.3',
                               'Programming Language :: Python :: 3.4',
                               'License :: OSI Approved :: MIT License'],
        author              = 'Jason Schulz',
        maintainer          = 'Jason Schulz',
        author_email        = 'jason@schulz.name',
        maintainer_email    = 'jason@schulz.name',
        keywords            = 'shell path file directory helper swap pivot',
        license             = 'MIT',
        scripts             = ['pm', 'cpm', 'upm', 'sw', 'pt', 'pts'],
)

