#!/bin/bash

if [ -e wynik.txt ]
then 
rm wynik.txt
fi

echo "Podaj liczbe "
read liczba
echo $liczba > dane.txt

while [ ! -e wynik.txt ]
do :
done

liczba=`head -n1 wynik.txt`
rm wynik.txt

if [ ! -z "$liczba" ]
then
echo "Twoj wynik to $liczba " 
else
echo "nie ma wyniku"
fi