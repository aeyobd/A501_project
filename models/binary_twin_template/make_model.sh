#!/bin/bash

TEMPLATE_DIR="./template"

period="$1"
echo $period

NEW_DIR="${period}d"

cp -r "$TEMPLATE_DIR" "$NEW_DIR"
sed -i "s/\$(INITIAL_PERIOD)/$period/" "$NEW_DIR/inlist"
