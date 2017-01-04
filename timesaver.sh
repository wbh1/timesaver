#!/bin/bash

#
# Functions
#

goHomeBuck(){
	echo "GO HOME BUCK!"
	exit
};

onePunch(user, pass){
	python timesaver_io.py $user $pass
	goHomeBuck()
};

teaTime(user, pass){
	python timesaver_lunch.py $user $pass
	goHomeBuck()
};

longHaul(user, pass){
	onePunch($user, $pass)
	sleep 18000 # 5 hours
	teaTime($user, $pass)
	sleep 18000 # 5 hours
	onePunch($user, $pass)
	goHomeBuck()
};

#
# Main
#

read $user -p "LUID: "
read $pass -s -p "Password: "
clear
echo "\n\t1. Single time punch."
echo "\t2. Lunch time punch."
echo "\t3. Full timecard automation."
echo "\tX. Exit.\n"
echo "What do you want to do?\n"
read answer
case $answer in
	1) onePunch($user, $pass);;
	2) teaTime($user, $pass);;
	3) longHaul($user, $pass);;
	X|x) goHomeBuck();;
	*) message="Wat?" ;;
esac;