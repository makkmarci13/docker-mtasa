#!/bin/bash

echo "User:"
echo $(id -u)
usermod -u $FTP_USER_ID mtasa
