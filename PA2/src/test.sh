#!/bin/sh
MYP="../my_pattern"
TAP="../ta_pattern"
SAMPLE="../sample_circuits"
MY="./atpg"
TA="../bin/golden_atpg"

for FILE in "$SAMPLE"/*.ckt
do
	NAME=$(echo $FILE | awk -F '[/]' '{print $3}' | awk -F '[.]' '{print $1}')
	$MY $SAMPLE/$NAME.ckt > $MYP/$NAME.ptn
	$TA $SAMPLE/$NAME.ckt > $TAP/$NAME.ptn
	diff $MYP/$NAME.ptn $TAP/$NAME.ptn > ../diff/${NAME}_diff.dat
done

#./atpg -fsim ../patterns/golden_c7552.ptn ../sample_circuits/c7552.ckt
