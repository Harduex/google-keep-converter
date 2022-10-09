# google-keep-converter
Bash scripts for manipulating google keep notes exports

## Dependencies
[jq](https://stedolan.github.io/jq/)

## Usage
### Converting all notes to `txt` files
Export your google keep notes from [google takeout](https://takeout.google.com/)

Copy / Replace `google-keep-converter/Data/Keep` with your exported `Keep` folder

Then in Bash:
```
$ cd google-keep-converter/Scripts
$ ./convertNotesToTxt.sh -d
```
use `-d` flag to include dates in the converted notes

Wait the script to finish execution.
Check your converted notes in `google-keep-converter/Data/Converted` directory. 

### Get random note
From converted notes
```
$ ./getRandomNoteTxt.sh
```

From original Keep folder
```
$ ./getRandomNoteJson.sh
```

Notes that you get are moved to `google-keep-converter/Data/Converted/Seen` directory.

### Split converted notes to multiple folders
```
$ ./splitConvertedNotesIntoFolders.sh -f 20
```
use `-f` flag to specify the count of files in every directory
