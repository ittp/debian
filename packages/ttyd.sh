#!/bin/sh
START=$0
if [ -e START ]; then
echo $START
else 
echo "no start"
fi

apt-get install -y build-essential cmake git libjson-c-dev libwebsockets-dev
git clone https://github.com/tsl0922/ttyd.git
cd ttyd && mkdir build && cd build
cmake ..
make && sudo make install
