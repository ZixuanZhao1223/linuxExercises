#!/bin/bash

#read specified columns from a specified file and writes its mean
if [[($# -ne 1) && ($# -ne 2) ]]; then
    echo "usage: $0 <column> [files.csv]" 1>&2
    exit 0
elif [[ $# -eq 1 ]]; then
    column=$1
    file=/dev/stdin    
else
    column=$1
    file=$2
fi

cut -d, -f $column $file | tail -n +2 | {
    line_count=0
    sum=0;
    while read n; do
	line_count=$(($line_count + 1))
	sum=$(($sum + $n))
    done;
    echo $sum/$line_count; }| bc -l



