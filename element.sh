
#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ -z $1 ]]
then 
echo Please provide an element as an argument.

#if input is a number

elif [[ $1 =~ ^[0-9]+$ ]]
then
atomic_number=$1
name=$($PSQL "SELECT name FROM elements WHERE atomic_number=$1")
symbol=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$1")
atomic_mass=$($PSQL "Select  atomic_mass from properties where atomic_number=$1")
melting_point_celsius=$($PSQL "Select melting_point_celsius  from properties where atomic_number=$1")
boiling_point_celsius=$($PSQL "Select boiling_point_celsius  from properties where atomic_number=$1")
type_id=$($PSQL "Select type_id from properties where atomic_number=$1")
type=$($PSQL "select type from types where type_id=$type_id")
echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."

#if input is symbol
elif [[ $($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'") ]]
then 
symbol=$1
#atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$symbol'")
#echo $($PSQL "SELECT atomic_number FROM elements WHERE symbol='$symbol'")
atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$symbol'")
name=$($PSQL "SELECT name FROM elements WHERE atomic_number=$atomic_number")
atomic_mass=$($PSQL "Select  atomic_mass from properties where atomic_number=$atomic_number")
melting_point_celsius=$($PSQL "Select melting_point_celsius  from properties where atomic_number=$atomic_number")
boiling_point_celsius=$($PSQL "Select boiling_point_celsius  from properties where atomic_number=$atomic_number")
type_id=$($PSQL "Select type_id from properties where atomic_number=$atomic_number")
type=$($PSQL "select type from types where type_id=$type_id")
echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
#if input is name
elif [[ $($PSQL "SELECT atomic_number FROM elements WHERE name='$1'") ]]
then 
name=$1
#atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$symbol'")
#echo $($PSQL "SELECT atomic_number FROM elements WHERE symbol='$symbol'")
atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE name='$name'")
symbol=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$atomic_number")
atomic_mass=$($PSQL "Select  atomic_mass from properties where atomic_number=$atomic_number")
melting_point_celsius=$($PSQL "Select melting_point_celsius  from properties where atomic_number=$atomic_number")
boiling_point_celsius=$($PSQL "Select boiling_point_celsius  from properties where atomic_number=$atomic_number")
type_id=$($PSQL "Select type_id from properties where atomic_number=$atomic_number")
type=$($PSQL "select type from types where type_id=$type_id")
echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
else
echo I could not find that element in the database.
fi
