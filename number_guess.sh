#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read uname
user_id=$($PSQL "Select user_id from users where username='$uname' ")

if [[ -z $user_id ]]
#user not in database
then 
insert_username=$($PSQL "insert into users(username) values ('$uname')")
user_id=$($PSQL "Select user_id from users where username='$uname' ")
echo Welcome, $uname! It looks like this is your first time here.
else
games_played=$($PSQL "select sum(game_nubmer) from games where user_id=$user_id")
best_game=$($PSQL "select min(guess_number) from games where user_id=$user_id")
if [[ -z $games_played ]]
then
echo Welcome back, $uname! You have played 0 games, and your best game took 0 guesses.
else
echo Welcome back, $uname! You have played $games_played games, and your best game took $best_game guesses.

#user not in database
fi
fi
#echo $(($RANDOM % 1000 + 1))
#generate a random number
RANDOM_NUMBER=$[ $RANDOM % 1000 + 1 ]
#input number
echo Guess the secret number between 1 and 1000:
read input_number
times_guess=1

until [[ $input_number = $RANDOM_NUMBER ]];
do 
if [[ ! $input_number =~ ^[0-9]+$ ]]

then 
#break
echo That is not an integer, guess again:

elif [[ $input_number -lt $RANDOM_NUMBER ]]
then 
echo "It's lower than that, guess again:"

elif [[ $input_number -gt $RANDOM_NUMBER ]]
then
echo "It's higher than that, guess again:"
fi
read input_number
let "times_guess += 1"
done

echo You guessed it in $times_guess tries. The secret number was $RANDOM_NUMBER. Nice job!
insert_result=$($PSQL "insert into games(user_id, game_nubmer, guess_number) values($user_id,1,$times_guess)" )

