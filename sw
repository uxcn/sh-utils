#!/usr/bin/env python

# sw - swap two files

# Copyright (c) 2015 Jason Schulz <https://github.com/uxcn>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# author: jason

from __future__ import print_function

import sys

import argparse

import os
import os.path

import stat
import shutil
import tempfile

c = sys.argv[0]

def on_error(e, x=1):
    if not e is None:
        print('%s: %s' % (c, e), file=sys.stderr)

    sys.exit(x)

def init(p):

    p.add_argument('-p', '--pivot', default=None, dest='pd', metavar='pivot', help='pivot')

    p.add_argument('a', help='a')
    p.add_argument('b', help='b')

p = argparse.ArgumentParser(add_help=False)

init(p)

r = p.parse_args()

a = r.a
b = r.b

pd = r.pd

pa = os.path.abspath(a)
pb = os.path.abspath(b)

if pd is None:
    pd = os.path.dirname(pa)

pd = tempfile.mkdtemp(prefix='sw.', dir=pd)
pc = os.path.join(pd, os.path.basename(pb))

try:

    shutil.move(pb, pc)

except OSError as e:

    shutil.rmtree(pd)

    on_error('%s (%s -> %s)' % (e.strerror, pb, pc))

try:

    shutil.move(pa, pb)

except OSError as e:

    if os.path.exists(pb):

        sb = os.lstat(pb)

        if stat.S_ISDIR(sb.st_mode):
            shutil.rmtree(pb)
        else:
            os.unlink(pb)

    shutil.move(pc, pb)
    shutil.rmtree(pd)

    on_error('%s (%s -> %s)' % (e.strerror, pa, pb))

try:

    shutil.move(pc, pa)

except OSError as e:

    if os.path.exists(pa):

        sa = os.lstat(pa)

        if stat.S_ISDIR(sa.st_mode):
            shutil.rmtree(pa)
        else:
            os.unlink(pa)

    shutil.move(pb, pa)
    shutil.move(pc, pb)
    shutil.rmtree(pd)

    on_error('%s (%s -> %s)' % (e.strerror, pc, pa))

try:

    shutil.rmtree(pd)

except OSError as e:

    on_error('%s (%s)' % (e.strerror, pd))

# vim:ft=python:et:ts=4:sts=4:sw=4:tw=80
