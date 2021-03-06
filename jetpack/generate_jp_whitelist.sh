#!/bin/bash

rm ../validator/testcases/jetpack_data.txt

cd addon-sdk
git pull origin --tags
for tagname in `git tag`;
do
    git checkout $tagname
    for f in `find . -type f -name "*.js"`;
    do
        python ../make_hash.py $f $tagname >> ../../validator/testcases/jetpack_data.txt
    done
done
