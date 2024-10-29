#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Clear both the teams and games tables to avoid duplicate data and reset primary keys
echo "$($PSQL "TRUNCATE TABLE teams, games RESTART IDENTITY;")"

# Step 1: Insert unique teams into the teams table
while IFS="," read -r year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]] # Skip header line
  then 
    # Insert winner team if not already in the database
    WINNER_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$winner') ON CONFLICT (name) DO NOTHING;")

    # Insert opponent team if not already in the database
    OPPONENT_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$opponent') ON CONFLICT (name) DO NOTHING;")
  fi
done < games.csv

# Step 2: Insert game data with correct team IDs into the games table
while IFS="," read -r year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then
    # Retrieve the team_id for the winner
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")
    
    # Retrieve the team_id for the opponent
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';")

    # Insert the game row with all required columns
    GAME_INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals);")
  fi
done < games.csv

echo "All teams and games data have been inserted into the database."