#!/bin/sh

curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
apt-get install -y nodejs

apt-get update && apt-get install -y curl wget nano sudo 
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null 
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list 
apt-get update
apt-get install yarn -y
