#!/bin/sh
#
# Simple untar + tarbomb guard.  Companion to 'mktar'.
#
# Usage: xtar dir.tar --> dir/
#        xtar files.tar --> files_tar_/[tar contents]
#
#
# Andrew Lytle [atlytle .at. gmail.com] (2014)

set -o nounset
set -o errexit

f="$1"
tmp="${f%.tar}_tar_"

# Make sure input is valid.
tar -tf "$f" > /dev/null

# Untar into tmp directory.
mkdir "$tmp"
tar xvf "$f" -C "$tmp"

# If there is only one item in tmp,
# move it to . and remove tmp.
nf=$(ls "$tmp" | wc -l)
if [ $nf -eq 1 ]; then
  t=$(ls "$tmp")
  if [ ! -e "$t" ]; then
    mv -n "${tmp}/${t}" .
    rmdir "$tmp"
  else
    echo "$t already exists."
    echo "Contents untarred into ${tmp}."
  fi
else
  echo "Contents untarred into ${tmp}."
fi
