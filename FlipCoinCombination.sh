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
        percentage=`echo ${dict[HHH]} $n | awk '{print ($1/$2)*1oo}'`
        echo "HHH:" $percentage"%"
        percentage=`echo ${dict[HHT]} $n | awk '{print ($1/$2)*1oo}'`
        echo "HHT:" $percentage"%"
        percentage=`echo ${dict[HTH]} $n | awk '{print ($1/$2)*1oo}'`
        echo "HTH:" $percentage"%"
        percentage=`echo ${dict[HTT]} $n | awk '{print ($1/$2)*1oo}'`
        echo "HTT:" $percentage"%"
	percentage=`echo ${dict[TTT]} $n | awk '{print ($1/$2)*1oo}'`
        echo "TTT:" $percentage"%"
        percentage=`echo ${dict[TTH]} $n | awk '{print ($1/$2)*1oo}'`
        echo "TTH:" $percentage"%"
        percentage=`echo ${dict[THT]} $n | awk '{print ($1/$2)*1oo}'`
        echo "THT:" $percentage"%"
        percentage=`echo ${dict[THH]} $n | awk '{print ($1/$2)*1oo}'`
        echo "THH:" $percentage"%"
	;;
esac

