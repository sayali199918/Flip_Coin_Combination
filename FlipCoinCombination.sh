#!/bin/bash -x
echo "Welcome to flip Coin Combination Program"
declare -A dict
read -p "Enter the number of times you want to flip a coin:" n
echo $n
echo "1.Single Combination\n2.Double Combination\n3.Triple Combination"
read -p "Enter your choice:" choice
case $choice in
	1)
	for (( i=0; i<$n; i++ ))
	do
		flipCoin=$(( RANDOM % 2 ))
		if [ $flipCoin -eq 1 ]
		then
			dict[H]=$(( ${dict[H]} + 1 ))
		else
			dict[T]=$(( ${dict[T]} + 1 ))
		fi
	done
	echo "H:" ${dict[H]}   "T:" ${dict[T]}
	if [[ ${dict[H]} -gt ${dict[T]} ]]
	then
		dict[percentage]=`echo ${dict[H]} $n | awk '{print (100*$1/$2)}'`
		echo "H is the winner and winning percentage is:" ${dict[percentage]}"%"
	else
		dict[percentage]=`echo ${dict[T]} $n | awk '{print (100*$1/$2)}'`
		echo "T is the winner and winning percentage is:" ${dict[percentage]}"%"
	fi
	;;
	2)
	for((i=0; i<$n; i++))
        do
		flipCoin1=$(( RANDOM % 4 + 1 ))
		case $flipCoin1 in
				1) dict[HH]=$(( ${dict[HH]} + 1 ));;
				2) dict[HT]=$(( ${dict[HT]} + 1 ));;
				3) dict[TH]=$(( ${dict[TH]} + 1 ));;
				4) dict[TT]=$(( ${dict[TT]} + 1 ));;
		esac
	done
	 echo "HH:" ${dict[HH]}   "HT:" ${dict[HT]}  "TH:" ${dict[TH]}  "TT:" ${dict[TT]}
	temp=$((${dict[HH]}))
	for i in ${!dict[@]}
	do
		if [[ ${dict[$i]} -ge $temp ]]
		then
			temp=$((${dict[$i]}))
			val=$i
		fi
	done
        dict[percentage]=`echo $temp $n | awk '{print (100*$1/$2)}'`
        echo "$val is the winning combination and winning percentage is:" ${dict[percentage]}"%"
	;;
	3)
	for((i=0; i<$n; i++))
        do
                flipCoin=$(( RANDOM % 8 + 1 ))
                case $flipCoin in
                                1) dict[HHH]=$(( ${dict[HHH]} + 1 ));;
                                2) dict[HHT]=$(( ${dict[HHT]} + 1 ));;
                                3) dict[HTH]=$(( ${dict[HTH]} + 1 ));;
                                4) dict[HTT]=$(( ${dict[HTT]} + 1 ));;
				5) dict[TTT]=$(( ${dict[TTT]} + 1 ));;
                                6) dict[TTH]=$(( ${dict[TTH]} + 1 ));;
                                7) dict[THT]=$(( ${dict[THT]} + 1 ));;
                                8) dict[THH]=$(( ${dict[THH]} + 1 ));;

                esac
        done
        echo "HHH:" ${dict[HHH]}   "HHT:" ${dict[HHT]}  "HTH:" ${dict[HTH]}   "HTT:" ${dict[HTT]}  "TTT:" ${dict[TTT]}  "TTH:" ${dict[TTH]}  "THT:" ${dict[THT]}  "THH:" ${dict[THH]}
	temp=$((${dict[HHH]}))
	for i in ${!dict[@]}
	do
		if [[ ${dict[$i]} -ge $temp ]]
	then
		temp=$((${dict[$i]}))
		val=$i
		fi
	done
        dict[percentage]=`echo $temp $n | awk '{print (100*$1/$2)}'`
        echo "$val is the winning combination and winning percentage is :" ${dict[percentage]}"%"
	;;
esac

