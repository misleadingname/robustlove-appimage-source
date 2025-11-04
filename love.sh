#!/bin/sh

if [ -z "$APPDIR" ]; then
    APPDIR="$(dirname "$(readlink -f "$0")")"
fi

export LD_LIBRARY_PATH="$APPDIR/lib/:$LD_LIBRARY_PATH"

if [ -z "$XDG_DATA_DIRS" ]; then #unset or empty
    XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
fi
export XDG_DATA_DIRS="$APPDIR/share/:$XDG_DATA_DIRS"

# uncomment and edit to add your own game
#FUSE_PATH="$APPDIR/my_game.love"
#FUSE_PATH="$APPDIR/my_game"

if [ -z "$FUSE_PATH" ]; then
    exec "$APPDIR/bin/love" "$@"
else
    exec "$APPDIR/bin/love" --fused "$FUSE_PATH" "$@"
fi
