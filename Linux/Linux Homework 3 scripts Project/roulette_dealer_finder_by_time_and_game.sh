
#!/bin/bash


#cat $1_Dealer_schedule | awk '{print $1 ,$2 ,$3 ,$4}'  | grep $3 | grep -iw $4

if [ $2 -eq 1 ]
then

cat $1_Dealer_schedule | awk '{print $1 ,$2 ,$3 ,$4}'  | grep $3 | grep -iw $4



elif [ $2 -eq 2 ]
then
cat $1_Dealer_schedule | awk '{print $1 ,$2 ,$5 ,$6}'  | grep $3 | grep -iw $4



else [ $2 -eq 3 ]

cat $1_Dealer_schedule | awk '{print $1 ,$2 ,$7 ,$8}'  | grep $3 | grep -iw $4



fi


#r,t,b
