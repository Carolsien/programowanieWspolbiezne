#!/bin/bash

#jesli liczba argumentow jest mniejsza niz 2
#wtedy program pokazuje nam z jakimi parametrami wywolac program
if [ $# -lt 2 ]
then
  echo "Użycie: ./szukaj.sh nazwa_pliku nazwa_katalogu"
  exit 0
fi

nazwa_pliku=$1
nazwa_katalogu=$2
if [ "$3" == "" ]
then
  poziom_pierwszej_rekursji=true
fi

# wypisujemy znalezione pliki i liczymy je
znaleznione=0
pliki=`ls -1 $nazwa_katalogu`
for plik in $pliki
do
  if [ "$pliki" == "$nazwa_pliku" ]
  then
    echo "$nazwa_katalogu/$plik"
    znalezione=$[$znalezione+1]
	#jesli istnieje i jest katalogiem
  elif [ -d $nazwa_katalogu/$plik ]
  then
    $0 $nazwa_pliku $nazwa_katalogu/$plik false &
    pids=("${pids[@]}" $!)
  fi
done
for pid in $pids
do
  wait $!
  znalezione=$[$znalezione+$?]
done

if [ ! $poziom_pierwszej_rekursji ]
then
  exit $znalezione
elif [ $znalezione -eq 0 ]
then
  echo Nie znaleziono.
fi
