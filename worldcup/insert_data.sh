#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    #insert team to teams table
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    #if not found
    if [[ -z $WINNER_ID ]]
    then
      #insert team
      TEAM_INSERTION_RESULT=$($PSQL"insert into teams(name) values('$WINNER')")
      echo $WINNER inserted to teams
    fi

    if [[ -z $OPPONENT_ID ]]
    then
      #insert team
      TEAM_INSERTION_RESULT=$($PSQL"insert into teams(name) values('$OPPONENT')")
      echo $OPPONENT inserted to teams
    fi
  fi
done
#insert into games
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    #insert team to teams table
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
    if [[ $RESULT == "INSERT 0 1" ]] 
    then
      echo $ROUND, $WINNER VS $OPPONENT, game inserted
    fi
  fi
done
