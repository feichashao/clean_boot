#!/bin/bash
#
# This script aims to clean the /boot directory.
# It will remove all the backup abi, config, initrd.img, System.map and vmlinuz file.
# It is highly recommended to backup those file, and using this script should be in your own risk.
#
# Tested in Ubuntu 14.04
#
# Usage: $ sudo ./clean_boot.sh
#
# Author: feichashao@gmail.com
#
# FIXME:
# 1. Too brust force.
# 2. Add more checking before doing these dirty things.
# 3. Should keep some recent backup files instead of delete all of them.
#
#
# 2015 Dec 20th
#

# Find out current linux version.
version=`uname -r`

# Temporarily rename the current version files. (yes, i am lazy to figure out how to remove all other file except these ones.)

mv /boot/abi-$version /boot/bk-abi-$version
mv /boot/config-$version /boot/bk-config-$version
mv /boot/initrd.img-$version /boot/bk-initrd.img-$version
mv /boot/System.map-$version /boot/bk-System.map-$version
mv /boot/vmlinuz-$version /boot/bk-vmlinuz-$version

# Remove all other backup files.
rm -rf /boot/abi-* /boot/config-* /boot/initrd.img-* /boot/System.map-* /boot/vmlinuz-*

# Rename backup the backup files.
mv /boot/bk-abi-$version /boot/abi-$version
mv /boot/bk-config-$version /boot/config-$version
mv /boot/bk-initrd.img-$version /boot/initrd.img-$version
mv /boot/bk-System.map-$version /boot/System.map-$version
mv /boot/bk-vmlinuz-$version /boot/vmlinuz-$version
