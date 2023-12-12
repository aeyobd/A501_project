#!/bin/bash

TEMPLATE_DIR="./template"
PARAM_FILE="./single_params.tsv"

set -e

if [ "$#" -ne 2 ]; then
	echo "requires 2 parameters"
	exit 1
fi

name="$1"

# read in mass and eta
printf -v mass "%0.2f" "$2"
printf -v m1 "%0.1f" "$2"
eta=$(awk -F'\t' "/^$m1/ { print \$2}" params.csv)
echo mass = $mass
echo eta = $eta

# check if file exists
if [ -d "$name" ]; then
	read -p "overwrite $name ? (y/N) " overwrite

	if [ "$overwrite" != "y" ] ; then
		echo error directory exists
		exit 1
	fi
else
	mkdir "$name"
fi


cp -rf "$TEMPLATE_DIR"/* "$name"
cd "$name"
sed -i "s/\$(STAR_MASS)/$mass/" "inlist"
sed -i "s/\$(BLOCKER_ETA)/$eta/" "inlist"
