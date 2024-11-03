#!/bin/bash

# Variable for SQL queries
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#=====USERNAME BLOCK=====#

# Function to validate username
validate_username() {
  if [[ -z $username || ${#username} -gt 22 ]]; then
    return 1
  else
    return 0
  fi
}

# Loop that asks for user to input username, exits only when user inputs a valid username
while true; do 
  echo -e "\nEnter your username:"
  read username

  # username validation
  if validate_username; then
    break
  else
    echo "Invalid username. Please enter a username that is 1-22 characters long and not empty."
  fi
done

# Check if username exists in the database
USER_ID=$($PSQL "SELECT user_id FROM usernames WHERE username = '$username';")

# If it doesn't exist in the database
if [[ -z $USER_ID ]]; then
  # Insert username in the database in the usernames table
  INSERT_USER_RESULT=$($PSQL "INSERT INTO usernames(username) VALUES('$username');")
  # Retrieve the new USER_ID after insertion
  USER_ID=$($PSQL "SELECT user_id FROM usernames WHERE username = '$username';")
  echo -e "\nWelcome, $username! It looks like this is your first time here."
else
  # Welcome back existing user
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games_played WHERE user_id = $USER_ID;")
  BEST_GAME=$($PSQL "SELECT COALESCE(MIN(guesses), 0) FROM games_played WHERE user_id = $USER_ID;")

  echo "Welcome back, $username! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

#=====GUESSING GAME BLOCK=====#
SECRET_NUMBER=$((RANDOM % 1000 + 1))
echo -e "\nGuess the secret number between 1 and 1000:"

NUMBER_OF_GUESSES=0

# Asking and checking user input
while true; do
  # Get a user input
  read GUESS
  
  # Check if the input is a valid number
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo -e "\nThat is not an integer, guess again:"
    continue
  fi

  # Increment the number of guesses
  ((NUMBER_OF_GUESSES++))

  # If the user gives a lower number
  if (( GUESS < SECRET_NUMBER )); then
    # Tell them it is higher  
    echo -e "\nIt's higher than that, guess again:"
  # If the user provides a higher number
  elif (( GUESS > SECRET_NUMBER )); then
    # Tell them it is lower
    echo -e "\nIt's lower than that, guess again:"
  else
    # They guessed correctly
    echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games_played(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES);")
    break  # Exit the loop when the correct number is guessed
  fi
done
