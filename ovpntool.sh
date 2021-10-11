#!/bin/bash


export arch=debian-amd64
export db=test

# $ git clone https://github.com/opencoff/ovpn-tool
# $ cd ovpn-tool
# $ ./build -s

clone() {
  git clone https://github.com/opencoff/ovpn-tool
  cd ovpn-tool
  ./build -s
}


install() 
{
    clone
    cp ./bin/${arch}/ovpn-tool /sbin/ovpn-tool
    
    #if [ -r 
#     cp ./bin/${arch}/ovpn-tool /sbin/ovpn-tool
    
    #${db}.db server --help

}
