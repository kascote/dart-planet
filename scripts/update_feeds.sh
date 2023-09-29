#!/usr/bin/bash

CWD="$(dirname "${BASH_SOURCE}")"
source "$CWD/_global.sh"

$CWD/$BIN/$EXEC feed update --all
