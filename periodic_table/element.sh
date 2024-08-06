#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_RESULT=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from properties inner join elements using(atomic_number) inner join types using(type_id) where atomic_number=$1 order by atomic_number")
    if [[ -z $ELEMENT_RESULT ]]
    then
      echo "I could not find that element in the database."
    else
      echo "$ELEMENT_RESULT" | while IFS="\|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINR_CELSIUS
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINR_CELSIUS celsius."
      done
    fi
  else
    ELEMENT_RESULT=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from properties inner join elements using(atomic_number) inner join types using(type_id) where name='$1' or symbol='$1' order by atomic_number")
    if [[ -z $ELEMENT_RESULT ]]
    then
      echo "I could not find that element in the database."
    else
      echo "$ELEMENT_RESULT" | while IFS="\|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINR_CELSIUS
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINR_CELSIUS celsius."
      done
    fi
  fi
fi
