#! /bin/bash

# Tigress can't see functions not called in main() if we don't strip the static qualifiers

if [ -z ${1+x} ]
then
    echo "Needs a filename"
else
    csmith | sed "s/static //g" > $1
fi
