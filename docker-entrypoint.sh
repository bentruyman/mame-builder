#!/usr/bin/env bash
set -e

if [ "$1" = 'compile' ]; then
  cd /tmp
  curl -Lo mame.tar.gz "https://github.com/mamedev/mame/archive/$MAME_VERSION.tar.gz"
  tar -zxvf mame.tar.gz
  cd "mame-$MAME_VERSION"
  make -j$(($(grep -c ^processor /proc/cpuinfo) + 1))
  cp mame64 /workspace

  exit 0
fi

exec "$@"
