#!/bin/bash
# This code formats all files in class activity folders, usually names '01-Activities'
# readme files are renamed for specificity
# Activites get zipped and renamed for specificity

for f in `ls -d */`
do
        cd $f
        dirname=${PWD##*/} 
        if [ -e 'README.md' ]
        then
                mv README.md $dirname'-README.md'    
        fi
        if [ -e 'Unsolved' ]
        then
                zip -r $dirname'-Unsolved' 'Unsolved'
        fi
        if [ -e 'Solved' ]
        then
                zip -r $dirname'-Solved' 'Solved'
        fi
        if ([ ! -e 'Solved' ] && [ ! -e 'Unsolved' ] && [ ! -e 'README.md' ])
        then
                cd ..
                zip -r $dirname'.zip' $dirname
                cd $dirname
        fi
        cd ..
done