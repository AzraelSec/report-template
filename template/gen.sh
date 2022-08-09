#!/bin/bash
INPUT_DIR=./src
OUTPUT=report.pdf
STYLE=breezedark

help() {
    echo "Add description of the script functions here."
    echo
    echo "args: [-i|h|o|s]"
    echo "options:"
    echo "i     Set input dir"
    echo "h     Show help"
    echo "o     Set output file"
    echo "s     Set syntax highlight style"
    echo
}

while getopts ":h" option; do
    case $option in
        h)
            help
            exit;;
        i)
            INPUT_DIR=$OPTARG;;
        o)
            OUTPUT=$OPTARG;;
        s)
            STYLE=$OUTARG;;
        \?)
            echo "Error: Invalid option"
            exit;;
    esac
done

pandoc $INPUT_DIR/*.md \
    -o $OUTPUT \
    --from markdown+yaml_metadata_block+raw_html \
    --template eisvogel \
    --table-of-contents \
    --toc-depth 6 \
    --number-sections \
    --top-level-division=chapter \
    --highlight-style $STYLE \
    --resource-path=.:assets
