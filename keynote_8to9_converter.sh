#!/bin/bash
# Fabrice Carrega 05/08/2014, based on Dan Swain 2009 to 2008 converter.

# Bash script to convert Keynote 2008 format to Keynote 2009.
#
# Many thanks to linux4research's blog post (see below) & Dan Swain
# http://linux4research.blogspot.com/2009/09/mac-keynote-2009-format.html

# Safe input handling - need at least one argument
if [ $# -ne 1 ]
then
  echo "Only one input argument allowed."
  exit
fi

INPUT=$1

# Basename doesn't work for keynote files...
BASE=${INPUT%.key}

TEMP=$BASE"_temp.key"

# Output filename
OUTPUT=$BASE"_2009.key"

# Copy file
echo "Copying $INPUT to $TEMP, this may take a moment.."
cp -R $INPUT $TEMP
echo "Done."

# Unzip index.apxl.gz
echo "Unzipping index.apxl.gz file."
INDEXAPXL=$TEMP/index.apxl.gz
gzip -d $INDEXAPXL
echo "Done."

# Change the version number in the index file
echo "Converting version string to 2009."
INDEXAPXL=$TEM/index.apxl
sed -i '' 's/key:version=\"[0-9]*/key:version=\"92008102400/g' $INDEXAPXL

# Zip file content
echo "Zipping $COPY."
cd $TEMP && zip -r -X ../$OUTPUT *.*
echo "Done."

# Remove temporary file
echo "Erasing $TEMP."
cd .. && rm -r $TEMP
echo "Done."
