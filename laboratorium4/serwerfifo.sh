#!/bin/bash
if [[ "$1" ]]; then
if [[ -p /tmp/klientfifo ]]; then
	
	echo $(expr $1 + $1 + $1) > /tmp/klientfifo
fi
else
trap "" SIGCHLD
trap "" SIGHUP
trap "" SIGTERM

if [[ ! -p /tmp/serwerfifo ]]
then
	mkfifo /tmp/serwerfifo
fi

while true
do
	if read line < /tmp/serwerfifo
	then
	$0 $line
	fi
done
fi


