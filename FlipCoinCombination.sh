#!/bin/bash -x
echo "Welcome to flip Coin Combination Program"
declare -A dict
read -p "Enter the number of times you want to flip a coin:" n
echo $n
for (( i=0; i<$n; i++ ))
do
	flipCoin=$(( RANDOM % 2 ))
	if [ $flipCoin -eq 1 ]
	then
		dict["H"]=$(( ${dict[H]} + 1 ))
	else
		dict["T"]=$(( ${dict[T]} + 1 ))
	fi
done
echo ${dict[H]}  ${dict[T]}
percentage=`echo ${dict[H]} $n | awk '{print ($1/$2)*1oo}'`
echo "H:" $percentage"%"
percentage=`echo ${dict[T]} $n | awk '{print ($1/$2)*1oo}'`
echo "T:" $percentage"%"
 
