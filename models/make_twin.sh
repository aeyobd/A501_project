#!/bin/bash


TEMPLATE_DIR="./binary_twin_template"

MASS1="$1"

INLIST1="../../single/${MASS1}M/inlist"

echo primary: $MASS1 

NEW_DIR="${MASS1}M_${MASS1}M"

cp -r "$TEMPLATE_DIR" "$NEW_DIR"

cd $NEW_DIR/template

if [ ! -f $INLIST1 ]; then
	echo not an inlist $INLIST1
	exit 1;
fi

sed -i "s/\$(STAR_MASS1)/$MASS1/" "inlist"

cd ..
sed -i "s+\$(INLIST1)+$INLIST1+" "inlist"
	
