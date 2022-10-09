#!/bin/bash

source .env

NOTES_DIR="$DATA_DIR/Keep"
SEEN_DIR="$NOTES_DIR/Seen"

getRandomNote() {
    RANDOM_FILE=$(ls $NOTES_DIR/*.json | shuf -n 1)
    echo "filename: $RANDOM_FILE"
    cat "$RANDOM_FILE" | ./lib/jq --raw-input --raw-output '. as $raw | try fromjson catch $raw'
    mkdir -p "$SEEN_DIR"
    mv "$RANDOM_FILE" "$SEEN_DIR"
}

getRandomNote