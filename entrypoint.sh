#!/bin/bash

echo $(id -u)
exec usermod -u $FTP_USER_ID mtasa
