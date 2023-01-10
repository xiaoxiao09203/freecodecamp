#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?"

main_menu(){
if [[ $1 ]]
then
echo $1
else
service=$($PSQL "select * from services")
echo "$service" | while read service_id BAR name
do
echo "$service_id) $name"
done
fi
}


main_menu

read SERVICE_ID_SELECTED
if [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]+$ ]]
then
echo -e "\nI could not find that service. What would you like today?"
main_menu
else
echo -e "\nWhat's your phone number?"
fi

read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")

if [[ -z $CUSTOMER_NAME ]]
then
echo -e "\nI don't have a record for that phone number, what's your name?"
read CUSTOMER_NAME
insert_name_result=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
fi

echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
read SERVICE_TIME
CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

insert_appointment_result=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED,'$SERVICE_TIME') ")

echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."

