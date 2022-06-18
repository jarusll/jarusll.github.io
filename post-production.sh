#!/bin/bash

cd /app
hugo --minify
./convert-to-webp.sh
# replace 
sed -i -r 's_(=/images/\w*)\.(jpg|png)_\1.webp_g' ./public/diary/index.html
# clean up diary images
find public/diary -type f -not -name "index.html" -exec rm -rf {} \;
