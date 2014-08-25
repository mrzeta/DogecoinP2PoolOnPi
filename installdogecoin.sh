#!/bin/bash
# The MIT License (MIT)

# Copyright (c) 2014 Antony Bailey

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
echo "Upgrade system and setup unattended security upgrades"
echo "This takes about 30 minutes, so go make a brew!"
apt-get update && apt-get upgrade && apt-get dist-upgrade && rpi-update 
echo "You need to say ok to the next step."
apt-get install unattended-upgrades apt-listchanges && dpkg-reconfigure -plow unattended-upgrades
echo "Installing System Requirements"
apt-get install build-essential pkg-config
apt-get install libtool autotools-dev autoconf automake
apt-get install libssl-dev
apt-get install libboost-all-dev
apt-get install libdb5.1-dev
apt-get install libdb5.1++-dev
apt-get install git
echo "Time to pull Dogecoin repo."
git clone https://github.com/dogecoin/dogecoin.git
cd dogecoin
echo "Start buiding Dogecoin. This takes forever"
./autogen.sh
./configure
make