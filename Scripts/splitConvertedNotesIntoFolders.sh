#!/bin/bash

source .env

NOTES_DIR="$DATA_DIR/Converted"

# default
DIR_FILES_COUNT=5

while getopts f: flag
do
    case "${flag}" in
        f) DIR_FILES_COUNT=${OPTARG};;
    esac
done


i=0; 
for FILE in $NOTES_DIR/*.txt; 
do 
    DIR=dir_$(printf %03d $((i/$DIR_FILES_COUNT+1))); 
    mkdir -p "$NOTES_DIR/$DIR"; 
    mv "$FILE" "$NOTES_DIR/$DIR"; 
    let i++; 
done
