#!/bin/bash

TESTNAME=$1

mkdir -p out

echo " ================================================"
echo "        test name: $TESTNAME"

if bin/$TESTNAME | tee out/$TESTNAME | grep FAILED
then
    cat out/$TESTNAME
    rm -f $TESTNAME.pass
    ln -sfv out/$TESTNAME $TESTNAME.fail
else
    cat out/$TESTNAME
    rm -f $TESTNAME.fail
    ln -sfv out/$TESTNAME $TESTNAME.pass
fi