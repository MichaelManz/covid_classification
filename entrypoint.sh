#!/bin/sh
set -e

WORKDIR=/var/workdir
NUM_PROC=$(grep -c ^processor /proc/cpuinfo)

OUTPUT_DIR_STATS=$WORKDIR/jpeg
mkdir -p "$OUTPUT_DIR_STATS"
cd "$OUTPUT_DIR_STATS"
echo "Running ps to jpeg on $WORKDIR/*ps into $OUTPUT_DIR_STATS"
find "$WORKDIR/" -name \*.ps -type f -print0 | xargs -0 -P $NUM_PROC -I {} /bin/bash -c 'if [ -f "$(basename {}).ps" ]; then printf "x"; else gs -sDEVICE=jpeg -sOutputFile="$(basename {}).jpg" -dBATCH -dNOPAUSE -r300 "{}";printf "o"; fi'
echo "..done"