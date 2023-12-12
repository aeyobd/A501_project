#!/bin/bash


TEMPLATE_DIR="./binary_template"

MASS1="$1"
MASS2="$2"

INLIST1="../../single/${MASS1}M/inlist"
INLIST2="../../single/${MASS2}M/inlist"

echo primary: $MASS1 
echo secondary: $MASS2 

NEW_DIR="${MASS1}M_${MASS2}M"

cp -r "$TEMPLATE_DIR" "$NEW_DIR"

cd $NEW_DIR/template

if [ ! -f $INLIST1 ]; then
	echo not an inlist $INLIST1
	exit 1;
fi
if [ ! -f $INLIST2 ]; then
	echo not an inlist $INLIST2
	exit 1;
fi




sed -i "s/\$(STAR_MASS1)/$MASS1/" "inlist"
sed -i "s/\$(STAR_MASS2)/$MASS2/" "inlist"

cd ..
sed -i "s+\$(INLIST1)+$INLIST1+" "inlist1"
sed -i "s+\$(INLIST2)+$INLIST2+" "inlist2"
	
