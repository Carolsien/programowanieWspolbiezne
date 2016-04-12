#!/bin/bash

while [ 1 ]
do
if [ -e dane.txt ]
then
liczba=`head -n1 dane.txt`
if [ ! -z "$liczba" ]
then
rm dane.txt
echo $(expr $liczba + $liczba + $liczba) > wynik.txt
fi
fi
done