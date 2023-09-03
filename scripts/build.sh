#!/bin/sh

CWD="$(dirname "${BASH_SOURCE}")"
source "$CWD/_global.sh"

SRC=$CWD/$BIN/dart_planet.dart
DST=$CWD/$BIN/$EXEC

dart compile exe $SRC -o $DST