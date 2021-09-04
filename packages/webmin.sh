#!/bin/sh

CONFIG=source . ./webmin.conf
### CONFIG ###
PROTO="http"
URL=`$PROTO://prdownloads.sourceforge.net/webadmin`
VER="1.981"
WGET="$URL/webmin_${VER}_all.deb"
### END CONFIG ###

if [ -e wget ]; 
then 
echo "WGET EXIST" 
fi

wget http://prdownloads.sourceforge.net/webadmin/webmin_1.981_all.deb
dpkg --install webmin_1.981_all.deb
