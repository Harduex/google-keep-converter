#!/bin/bash

source .env

NOTES_DIR="$DATA_DIR/Keep"
OUPTUT_NOTES="$NOTES_DIR/*.json"
CONVERTED_NOTES_DIR="$DATA_DIR/Converted"
NOTES_COUNT=$(ls $NOTES_DIR/*.json | wc -l)

mkdir -p $CONVERTED_NOTES_DIR

# default
INCLUDE_DATE=false

while getopts d FLAG; do
  case "$FLAG" in
  d) INCLUDE_DATE=true ;;
  esac
done

PROCESSED_NOTES=0
for NOTE in $OUPTUT_NOTES; do
  echo "Processing $NOTE file..."
  FILENAME="$(basename "$NOTE" .json)"
  FILENAME=${FILENAME// /_}
  CONVERTED_NOTE="$CONVERTED_NOTES_DIR/$FILENAME.txt"

  if [ -f "$CONVERTED_NOTE" ]; then
    echo "file $CONVERTED_NOTE exists. Skipping."
  else
    echo "Generating $CONVERTED_NOTE file..."
    if [$INCLUDE_DATE]; then
      DATE_CREATED_TIMESTAMP=$(cat "$NOTE" | ./lib/jq -r '.createdTimestampUsec')
      DATE_CREATED=$(date +'%d-%m-%Y %H:%M:%S' -d @"$(($DATE_CREATED_TIMESTAMP / 1000000))")
      printf "$DATE_CREATED\n\n" >>$CONVERTED_NOTE
    fi
    cat "$NOTE" | ./lib/jq -r '.title' | awk NF >>$CONVERTED_NOTE
    cat "$NOTE" | ./lib/jq -r '.textContent' | awk NF >>$CONVERTED_NOTE
    let PROCESSED_NOTES++
    echo "Note: [$PROCESSED_NOTES/$NOTES_COUNT]"
    # clear
  fi
done

echo "Done."
echo "Notes Location: $CONVERTED_NOTES_DIR"
