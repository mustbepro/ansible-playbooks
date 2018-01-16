#!/bin/bash

DB=test_db

mysql -e "create database $DB;"

i=0
while [ $i -lt 10 ]
do

	mysql -D $DB -e "create table name_$i (col_name dec(20,19));"

	j=0
	while [ $j -lt 100 ]
	do
		mysql -D $DB -e "insert into name_$i select rand();"
		j=$[$j+1]
	done

	i=$[$i+1]
done

