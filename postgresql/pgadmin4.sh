#!/bin/env sh

install="web"
echo $install


key() {
  sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
  sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
}


sudo_install() {
  
  sudo apt install pgadmin4-web 
}

sudo_setup() {
  sudo /usr/pgadmin4/bin/setup-web.sh
}


install() {
  apt install pgadmin4-web 
}

setup() {
  /usr/pgadmin4/bin/setup-web.sh
}
