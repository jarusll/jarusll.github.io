#!/bin/bash

for FILE in `find ./public/images -type f -name '*png' -o -name '*jpg'`; do
    name=`echo $FILE | cut -d '.' -f 1`
    cwebp -mt -progress -q 50 -m 6 $FILE -o $name.webp
done
