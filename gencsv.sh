#!/bin/bash

##generate Random number and store in a array
if [ -f inputFile ]
  then
    cat /dev/null >inputFile
 fi
max=10
count=1
while [ "$count" -le "$max" ]
 do
   number[$count]=`od -An -N1 -i /dev/random`
   let "count +=1"
 done
##for loop to iterate over array and print index and number.
for ((i=0;i < ${#number[@]}; ++i))
 do
   p=`expr $i + 1`
   echo $p, ${number[$p]}
done >>inputFile


