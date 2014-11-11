#!/bin/sh
#
# Simple tar.  Companion to 'xtar'.
# Usage: mktar dir/ --> dir.tar.
#
# Andrew Lytle [atlytle .at. gmail.com] (2014)

set -o nounset
set -o errexit

d="$1"  # Directory to tar.
f="${d%/}.tar"  # Target.

if [ ! -d "$d" ]; then
  echo "${d}: No such directory."
  exit 1
fi

if [ ! -e "$f" ]; then
  tar cvf "$f" "$d"
else
  echo "$f already exists."
fi
