#!/bin/bash

declare FILE="/sys/class/net/"
declare NET="/sys/class/net/"
declare MTD="/sys/class/mtd/"
if [ -r $@ ];
then
    ls $1
    echo "OK"
    

else 
    echo "No FILE"

fi


    for item in $(ls `${NET}`)
        do
        echo $item
    done

items() {
    declare FILE=$1

    for item in $(ls `${FILE}`)
        do
        echo $item
    done
}


# for iface in $(ls /sys/class/net/)
#     do
#     echo $iface
# done
