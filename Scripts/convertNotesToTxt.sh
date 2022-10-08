#!/bin/bash

DATA_DIR="../Data"
NOTES_DIR="$DATA_DIR/Keep"
OUPTUT_NOTES="$NOTES_DIR/*.json"
CONVERTED_NOTES_DIR="$DATA_DIR/Converted"
NOTES_COUNT=$(ls $NOTES_DIR | wc -l)

mkdir -p $CONVERTED_NOTES_DIR
PROCESSED_NOTES=1

for NOTE in $OUPTUT_NOTES; do
  echo "Note: [$PROCESSED_NOTES/$NOTES_COUNT]"
  echo "Processing $NOTE file..."
  # FILENAME="$(basename "$INPUT_FILE_PATH" .json)"
  FILENAME="$(basename "$NOTE" .json)"
  FILENAME=${FILENAME// /_}
  CONVERTED_NOTE="$CONVERTED_NOTES_DIR/$FILENAME.txt"

  if [ -f "$CONVERTED_NOTE" ]; then
    echo "file $CONVERTED_NOTE exists. Skipping."
  else
    echo "Generating $CONVERTED_NOTE file..."
    cat "$NOTE" | jq -r '.title' | awk NF >>$CONVERTED_NOTE
    cat "$NOTE" | jq -r '.textContent' | awk NF >>$CONVERTED_NOTE
    let PROCESSED_NOTES++
    clear
  fi

done

echo "Done."
