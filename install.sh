#!bin/bash

export NODE_VER="lts"
export ADD_YARN=true
export user=''
export host=''

sudo_yarn_installer() {

    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
     echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
     sudo apt-get update && sudo apt-get install yarn
     
}

root_yarn_installer() {

  curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null
  echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list
  apt-get update && apt-get install yarn
     
}

export SSH="ssh $user@$host -p $port -vvv -T -R 0.0.0.0:22:0.0.0.0:2322"


export INSTALL="autossh sshpass git wget curl"

preinit() {
  apt update && apt-get install ${INSTALL} -y
}

ssh_config() {
  curl -fsSL https://dev.ittps.ru/ssh.sh | bash -
}

setup_config() {
    curl -fsSL https://dev.ittps.ru/ssh_config.sh | bash -
}

install_node() {
  curl -fsSL https://deb.nodesource.com/setup_${NODE_VER}.x | bash -
  apt-get install -y nodejs
}


yarn_pubkey() {
export YARN_PUBKEY="${{github.secrets.YARN_PUBKEY}}"

echo YARN_PUBKEY
}


yarn_init() {
  # source . ${{github.workspace}}/packages/yarn
#apt-get update && apt-get install -y curl wget nano sudo 
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | tee /usr/share/keyrings/yarnkey.gpg >/dev/null 
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list 

  #curl -fsSL $YARN_URL | bash -
#  apt-get install -y nodejs
}


if [ -e $NODE_VER ];
then 
echo $NODE_VER
else
  echo "NODE version?"
fi



install_all() {
  export APPS="nodejs yarn"
  apt-get update && apt-get install $APPS -y
}
