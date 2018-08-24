#!/bin/bash

for f in `ls -d */`
do
        cd $f
        dirname=${PWD##*/} 
        if [ -e 'README.md' ]
        then
                mv README.md $dirname'-README.md'
                # echo $dirname'-README.md'       
        fi
        if [ -e 'Unsolved' ]
        then
                zip -r $dirname'-Unsolved' 'Unsolved'
                # echo $dirname'-Unsolved'
        fi
        if [ -e 'Solved' ]
        then
                zip -r $dirname'-Solved' 'Solved'
                # echo $dirname'-Solved'
        fi
        if ([ ! -e 'Solved' ] && [ ! -e 'Unsolved' ] && [ ! -e 'README.md' ])
        then
                cd ..
                zip -r $dirname'.zip' $dirname
                cd $dirname
        fi
        cd ..
done