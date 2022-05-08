#!/bin/bash
#
# Copyright 2018 Niklas Jakobsson
#
# This file is part of Remanola.
#
# Remanola is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Remanola is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Remanola.  If not, see <http://www.gnu.org/licenses/>.

set -e

. ./VERSION

BUILDDIR="/tmp/remanola-build"
TARGETDIR="$BUILDDIR/target"
ZIPFILE="$BUILDDIR/Remanola-$VERSION.zip"

./install.sh $TARGETDIR

rm -f $ZIPFILE

cd $TARGETDIR
zip -r $ZIPFILE .
