#!/bin/bash

source .env

NOTES_DIR="$DATA_DIR/Converted"
SEEN_DIR="$NOTES_DIR/Seen"

getRandomNote() {
    RANDOM_FILE=$(ls $NOTES_DIR/*.txt | shuf -n 1)
    echo "file: $RANDOM_FILE"
    cat "$RANDOM_FILE"
    mkdir -p "$SEEN_DIR"
    mv "$RANDOM_FILE" "$SEEN_DIR"
}

getRandomNote