#!/bin/bash
#
# Script to start a terminal (and maybe a REPL within) in a pane to the right. Needs wezterm.
# Looks at the file extention of the passed in ARG and starts Julia, Python or Matlab if it
# is a file of that type, otherwise just a terminal.

filename="$1"
shift  # Remove filename from args list
# Extract the file extension
extension="${filename##*.}"
# Convert extension to lowercase for comparison
extension=$(echo "$extension" | tr '[:upper:]' '[:lower:]')

# Launch appropriate interpreter based on extension
case "$extension" in
    "jl")
        echo "Starting Julia..."
        wezterm cli split-pane --right bash -i -c "julia --project; exec bash"
        ;;
    "py")
        echo "Starting Python..."
        wezterm cli split-pane --right bash -i -c "python3; exec bash"
        ;;
    *)
        echo "Starting shell"
        wezterm cli split-pane --right
        ;;
esac