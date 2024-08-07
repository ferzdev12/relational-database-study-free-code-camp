#!/bin/bash
RANDOM_NUMBER=$(( 1 + $RANDOM % 1000))
NUMBER_OF_GUESSES=0
echo $RANDOM_NUMBER
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read USERNAME
USERNAME_RESULT=$($PSQL "select * from player where username='$USERNAME'")
if [[ -z $USERNAME_RESULT ]]
then
  NEW_USER_ADD_RESULT=$($PSQL "insert into player(username) values('$USERNAME')")
  if [[ ! -z $NEW_USER_ADD_RESULT ]]
  then
    echo Welcome, $USERNAME! It looks like this is your first time here.
    echo "Guess the secret number between 1 and 1000:"
    read GUESS
    ((NUMBER_OF_GUEESES++))
    while [[ $GUESS != $RANDOM_NUMBER ]]
    do
      if [[ ! $GUESS =~ ^[0-9]+$ ]]
      then
        echo "That is not an integer, guess again:"
        read GUEES
      else
        if [[ $GUESS > $RANDOM_NUMBER ]]
        then
          echo "It's higher than that, guess again:"
          read GUESS
          ((NUMBER_OF_GUEESES++))
        else
          echo "It's lower than that, guess again:"
          read GUESS
          ((NUMBER_OF_GUEESES++))
        fi
      fi
    done
    echo You guessed it in $NUMBER_OF_GUEESES tries. The secret number was $RANDOM_NUMBER. Nice job!
    DATABASE_UPDATE=$($PSQL "update player set games_played=$GAMES_PLAYED+1, best_game=$NUMBER_OF_GUEESES")
  fi
else
  echo "$USERNAME_RESULT" | while IFS="\|" read USERNAME GAMES_PLAYED BEST_GAME
  do
   echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
  done
  echo "Guess the secret number between 1 and 1000:"
  read GUESS
  ((NUMBER_OF_GUEESES++))
  while [[ $GUESS != $RANDOM_NUMBER ]]
  do
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      read GUESS
    else
      if [[ $GUESS > $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
        read GUESS
        ((NUMBER_OF_GUEESES++))
      else
        echo "It's lower than that, guess again:"
        read GUESS
        ((NUMBER_OF_GUEESES++))
      fi
    fi
  done
  echo You guessed it in $NUMBER_OF_GUEESES tries. The secret number was $RANDOM_NUMBER. Nice job!
  DATABASE_UPDATE=$($PSQL "update player set games_played=$GAMES_PLAYED+1")
  if [[ $BEST_GAME > $NUMBER_OF_GUEESES ]]
  then
    DATABASE_UPDATE=$($PSQL "update player set best_game=$NUMBER_OF_GUEESES")
  fi
fi

