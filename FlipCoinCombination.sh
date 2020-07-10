#!/bin/bash -x
echo "Welcome to flip Coin Combination Program"
declare -A dict
read -p "Enter the number of times you want to flip a coin:" n
echo $n
echo "1.Single Combination\n2.Double Combination"
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
	echo ${dict[H]}  ${dict[T]}
	percentage=`echo ${dict[H]} $n | awk '{print ($1/$2)*1oo}'`
	echo "H:" $percentage"%"
	percentage=`echo ${dict[T]} $n | awk '{print ($1/$2)*1oo}'`
	echo "T:" $percentage"%"
	;;
	2)
	for((i=0; i<$n; i++))
        do
		flipCoin1=$(( RANDOM % 4 + 1 ))
	    	#flipCoin2=$(( RANDOM % 2 ))
		case $flipCoin1 in
				1) dict[HH]=$(( ${dict[HH]} + 1 ));;
				2) dict[HT]=$(( ${dict[HT]} + 1 ));;
				3) dict[TH]=$(( ${dict[TH]} + 1 ));;
				4) dict[TT]=$(( ${dict[TT]} + 1 ));;
		esac
	done
	echo ${dict[HH]}  ${dict[HT]} ${dict[TH]} ${dict[TT]}
        percentage=`echo ${dict[HH]} $n | awk '{print ($1/$2)*1oo}'`
        echo "HH:" $percentage"%"
        percentage=`echo ${dict[HT]} $n | awk '{print ($1/$2)*1oo}'`
        echo "HT:" $percentage"%"
        percentage=`echo ${dict[TH]} $n | awk '{print ($1/$2)*1oo}'`
        echo "TH:" $percentage"%"
        percentage=`echo ${dict[TT]} $n | awk '{print ($1/$2)*1oo}'`
        echo "TT:" $percentage"%"
esac
