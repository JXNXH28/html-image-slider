#!/bin/bash

# clean public directory and copy all files from src
rm -rf public && mkdir public
cp -a ../src/. public/

### images
# declare sizes
declare -a sizes=('710' '1000' '1420')

# loop over images
for image in ../public/img/*; do
  # loop over sizes
  for size in "${sizes[@]}"; do
    # define new filenames
    fnamelength=${#image}
    outputimage=${image:0:(fnamelength-4)}-${size}${image:(fnamelength-4):fnamelength}
    # create new files
    cp $image $outputimage
    # resize
    sips $outputimage -Z $size
  done
  # delete original image
  rm $image
done

# optimise images (if argument -d [development] is not present)
if [[ $1 != '-d' && '$1' != '' ]]; then
  mkdir ../public/imgmin
  imagemin ../public/img/* --out-dir=public/imgmin
  rm -rf ../public/img && mkdir ../public/img
  cp -a ../public/imgmin/. ../public/img
  rm -rf ../public/imgmin
fi

### autoprefixer
postcss --use autoprefixer -r ../public/css/style.css

### minify css
cleancss -o ../public/css/style.min.css ../public/css/style.css
timestamp=$(date +%s)
mv ../public/css/style.min.css ../public/css/$timestamp.style.min.css
replace 'css/style.css' 'css/'$timestamp'.style.min.css' ../public/index.html
replace 'css/style.css' 'css/'$timestamp'.style.min.css' ../public/404.html
rm ../public/css/style.css