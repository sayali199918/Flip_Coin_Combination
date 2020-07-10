#!/bin/bash -x
echo "Welcome to flip Coin Combination Program"
flipCoin=$(( RANDOM % 2 ))
if [ $flipCoin -eq 1 ]
then
	echo "Head"
else
	echo "Tail"
fi
