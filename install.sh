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

INSTALLBASE="/Library/Application Support/Propellerhead Software/Remote"

if [ ! -z $1 ];then
	INSTALLBASE=$1
fi

export CODECSDIR="$INSTALLBASE/Codecs/Lua Codecs/Remanola/"
export MAPSDIR="$INSTALLBASE/Maps/Remanola/"
OUTDIR="/tmp/remanola-out"

if [ ! -d "$CODECSDIR" ]; then
	mkdir -p "$CODECSDIR"
fi

if [ ! -d "$MAPSDIR" ]; then
	mkdir -p "$MAPSDIR"
fi

if [ ! -d "$OUTDIR" ]; then
	mkdir -p "$OUTDIR"
fi

./build_remotemap.py

cp -r Codecs/Lua\ Codecs/Remanola/Launchpad-Mini.lua "$CODECSDIR"
cp -r Codecs/Lua\ Codecs/Remanola/Launchpad-Mini.luacodec "$CODECSDIR"
cp -r Codecs/Lua\ Codecs/Remanola/Launchpad-Mini.png "$CODECSDIR"
cp COPYING "$CODECSDIR"
cp README.md "$CODECSDIR"
cp -r $OUTDIR/Launchpad-Mini.remotemap "$MAPSDIR"
