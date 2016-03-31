#!/bin/bash

if [ ! -p /tmp/klientfifo ] 
then
	mkfifo /tmp/klientfifo
fi

echo $1 > /tmp/serwerfifo
read line < /tmp/klientfifo
echo $line
