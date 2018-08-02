#!/bin/bash
set -e

if [ $(id -u) = 0 ]; then
  if [[ -v UID ]]; then
    usermod -u $UID mtasa
  fi
  if [[ -v GID ]]; then
    groupmod -g $GID mtasa
  fi
fi
