#!/bin/bash
git fetch 
git pull
FILES=./*.html
for f in $FILES
do
  echo "Processing $f file..."
  sed '/<head>/ r gtag.js' $f  > test
  rm $f
  cat test > $f
  rm test
done
sed -i '' '/mobirise.site/d' *.html

git commit -a -m "Update Analytics"
git push

