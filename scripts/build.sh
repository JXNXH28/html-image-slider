#!/bin/bash

#clean public directory and copy files from src
rm -rf ../public && mkdir ../public
cp -a ../src/. ../public/

### minify css
for stylesheet in ../public/css/*.css; do
    cat ${stylesheet} | \
    sed -r ':a; s%(.*)/\*.*\*/%\1%; ta; /\/\*/ !b; N; ba' \
    | tr -d '\t' | tr -d ' ' | tr -d '\n' | tr -s ' ' ' ' > ${stylesheet%.css}.min.css
    rm ${stylesheet}
done

embed minify in html
for html in ../public/*.html; do
    echo $html
    replace 'main.css' 'main.min.css' ${html}
done