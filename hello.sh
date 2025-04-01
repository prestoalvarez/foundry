#!/bin/bash

# Check if a directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <folder>"
    exit 1
fi

folder="$1"

# Loop through directories ending in ".sol" in the specified folder
for d in "$folder"/*.sol; do
    if [ -d "$d" ]; then
        # Extract the base name without the .sol suffix
        base=$(basename "$d" .sol)
        # Get the full absolute path to the directory
        fullpath=$(realpath "$d")
        
        # Print the formatted output
        echo "sol!("
        echo "    #[sol(abi)]"
        echo "    ${base},"
        echo "    \"${fullpath}/${base}.json\""
        echo ");"
        echo
    fi
done
