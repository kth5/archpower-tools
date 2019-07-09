#!/bin/bash

# this is an example script and shall never be used as is!

source $1
_depends=$(for pkg in ${depends[@]} ${makedepends[@]}; do echo $pkg; done | grep "^haskell-" | grep -v 'ghc')
unset depends
unset makedepends
unset checkdepends

grep "^$(dirname $1)$" /tmp/rebuilt.txt &>/dev/null

if [ $? -gt 0 ]; then
  for pkg in ${_depends[@]}; do
    echo "Forking for ${pkg}..."
    ./rebuild.sh ${pkg}/PKGBUILD
  done

  echo "Rebuilding $(dirname $1)..."
  (
    cd $(dirname $1)
    sudo pacman -Scc --noconfirm
    sudo pacman -Sy
     makepkg -csr --noconfirm --nocheck 
    if [ $? -gt 0 ]; then
       exit 1
    fi
    (cd /home/kth5/arch/repo; repo-add repo-local.db.tar.xz $(dirname $1)*pkg.tar.xz; sudo pacman -Scc --noconfirm; sudo pacman -Sy)
    echo $(dirname $1) >> /tmp/rebuilt.txt
  )
else
  echo "Skipping $(dirname $1)..."
fi
