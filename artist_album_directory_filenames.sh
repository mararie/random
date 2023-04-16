#!/bin/bash
#
# Organize music files into folders based on ID3 tags
#
for FILE in *; 
do
ARTIST=`ffprobe -loglevel error -show_entries format_tags=artist -of default=noprint_wrappers=1:nokey=1 "$FILE"`;
ALBUM=`ffprobe -loglevel error -show_entries format_tags=album -of default=noprint_wrappers=1:nokey=1 "$FILE"`;
DATE=`ffprobe -loglevel error -show_entries format_tags=date -of default=noprint_wrappers=1:nokey=1 "$FILE"`;
mkdir -p "$ARTIST/$DATE - $ALBUM"
mv "$FILE" "$ARTIST/$DATE - $ALBUM"
done
