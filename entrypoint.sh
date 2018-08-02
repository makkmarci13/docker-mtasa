#!/bin/bash
set -e

cd /home/mtasa

useradd -u $UID -d /home/mtasa mtasa
chown -R mtasa mtasa
