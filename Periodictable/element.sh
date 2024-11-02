#!/bin/bash

if [ -z "$1" ]; then
  echo "Please provide an element as an argument."
  exit 0
fi

# Connect to the PostgreSQL database and fetch the element details
element_info=$(psql -U freecodecamp -d periodic_table -t -A -F "|" -c "
  SELECT elements.atomic_number, elements.name, elements.symbol, types.type, 
         properties.atomic_mass, properties.melting_point_celsius, 
         properties.boiling_point_celsius
  FROM elements
  JOIN properties ON elements.atomic_number = properties.atomic_number
  JOIN types ON properties.type_id = types.type_id
  WHERE elements.atomic_number::text = '$1'
     OR elements.symbol ILIKE '$1'
     OR elements.name ILIKE '$1';")

# Check if element_info is empty
if [ -z "$element_info" ]; then
  echo "I could not find that element in the database."
else
  # Use | as the delimiter and read values into variables
  IFS="|" read -r atomic_number name symbol type atomic_mass melting_point boiling_point <<< "$element_info"
  
  # Format and output the element information
  echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
fi
