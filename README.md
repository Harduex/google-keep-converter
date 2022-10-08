# google-keep-converter
Bash scripts for manipulating google keep notes exports

## Usage
### Converting all notes to `txt` files
Export your google keep notes from [google takeout](https://takeout.google.com/)
Copy / Replace `google-keep-converter/Data/Keep` with your exported `Keep` folder

Then in Bash:
```
$ cd google-keep-converter/Scripts
$ ./convertNotesToTxt.sh
```

Wait the script to finish execution.
Check your converted notes in `google-keep-converter/Data/Converted` directory. 