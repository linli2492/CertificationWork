#!/bin/bash

# Define the PSQL command
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

# Fetch the services and store them in a variable
SERVICES=$($PSQL "SELECT service_id, name FROM services")

# Function to display the services menu
SERVICE_MENU() {
  echo -e "\nHere are the services we offer:"
  echo "$SERVICES" | while IFS="|" read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
}

# Display the service menu
SERVICE_MENU

# Prompt the user to choose a service
echo -e "\nWhat service would you like?"
read SERVICE_ID_SELECTED

# Service validation
VALID_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")

if [[ -z $VALID_SERVICE ]]
then
  # If the service ID is not valid, show an error and exit
  SERVICE_MENU "\nInvalid service. Please run the script again and select a valid service."
else
  # If the service is valid, proceed
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo -e "\nYou selected service ID: $SERVICE_ID_SELECTED"

  # Get customer phone number
  echo -e "\nPlease enter your phone number:"
  read CUSTOMER_PHONE

  # Check if the customer already exists
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # If the customer does not exist
  if [[ -z $CUSTOMER_ID ]]
  then
    # Ask for the customer's name
    echo -e "\nIt seems you are a new customer. What is your name?"
    read CUSTOMER_NAME

    # Add the new customer to the customers table
    INSERT_CUSTOMER_DETAILS=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    
    # Retrieve the newly created customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  fi

  # Ask for an appointment time
  echo -e "\nWhat time would you like your appointment?"
  read SERVICE_TIME

  # Insert the appointment into the appointments table
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  # Confirm the appointment
  echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
fi
