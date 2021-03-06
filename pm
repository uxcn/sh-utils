#!/usr/bin/env python

# pm - move p to p`

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

c = sys.argv[0]

def on_error(e, x=1):
    if not e is None:
        print('%s: %s' % (c, e), file=sys.stderr)

    sys.exit(x)

def init(p):

    p.add_argument('ps', nargs='+', metavar='path', help='paths')

    p.add_argument('-f', '--force', default=False, dest='f', action='store_const', const=True, help='force')
    p.add_argument('-i', '--interactive', default=False, dest='f', action='store_const', const=False, help='interactive')

    g = p.add_mutually_exclusive_group()

    g.add_argument('-s', '--suffix', default="",  dest='s', metavar='suffix', help='suffix')
    g.add_argument('-p', '--prefix', default="",  dest='p', metavar='prefix', help='prefix')

g = argparse.ArgumentParser(add_help=False)

init(g)

a = g.parse_args()

f = a.f
s = a.s
x = a.p


s = s if x or s else "'"
x = x if x or s else "."

ps = reversed(a.ps)

for p in ps:

    p = os.path.abspath(p)
    d = os.path.dirname(p)
    b = os.path.basename(p)

    pm = '%s%s%s' % (x, b, s)
    pm = os.path.join(d, pm)

    if os.path.lexists(pm):

        prompt = '%s: overwrite (%s)? ' % (c, pm)

        if not f and input(prompt) not in ['Y', 'y']:
            continue

    try:
        os.rename(p, pm)
    except OSError as e:
        on_error('%s (%s -> %s)' % (e.strerror, p, pm))

# vim:ft=python:et:ts=4:sts=4:sw=4:tw=80
