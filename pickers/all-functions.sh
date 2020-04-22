#! /bin/bash

LIST1=$(readelf -sW $1 | awk '{if ($4 == "FUNC") print $8 }' | grep -v __libc | grep -v @ | grep -v _start | grep -v _init | grep -v _fini | sort)
LIST2=$(nm -g $1 | cut -d ' ' -f 3 | sort)
RESULT=$(comm -12 <(echo "$LIST1") <(echo "$LIST2"))
echo $RESULT | tr " " ","
