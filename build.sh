#!/bin/sh
# Define Vars
VERSION=$(sed -nr 's/.+"version": "([0-9\\\.]+)".+/\1/pg' info.json)
MODNAME=$(sed -nr 's/.+"name": "(.*)".+/\1/pg' info.json)
DIR_NAME=".build"
BUILDER_NAME="build.sh"
GIT=".git"
GITIGNORE=".gitignore"
DOCUMENTATION=".documentation"
VSCODE=".vscode"
CONTROL_LUA="control.lua"
DATA_LUA="data.lua"
FINAL_MOD_FOLDER=$MODNAME'_'$VERSION

# Remove old build directory
if [ -d "$DIR_NAME" ]; then
	rm -rf $DIR_NAME
fi

# Remove make new build directory
mkdir -p ./$DIR_NAME/$FINAL_MOD_FOLDER

# Copy files into the new directory
# - not the new build directory
# - not the build script
# - not .git
# - not .gitignore
find . -maxdepth 1 ! -regex '.*/'$DIR_NAME ! -regex '.*/'$BUILDER_NAME ! -regex '.*/'$GIT ! -regex '.*/'$GITIGNORE ! -regex '.*/'$DOCUMENTATION ! -regex '.*/'$VSCODE ! -regex '.' -exec cp -r '{}' $DIR_NAME/$FINAL_MOD_FOLDER \;

# run pngquant on the png files
find ./$DIR_NAME/$FINAL_MOD_FOLDER -name '*.png' -print0 | xargs -0 -P5 -L1 pngquant --ext .png --force 256

# unset debug mode in control.lua if it exists
if test -f ./$DIR_NAME/$FINAL_MOD_FOLDER/$CONTROL_LUA; then
	sed -i -e 's/is_debug_mode = true/is_debug_mode = false/g' ./$DIR_NAME/$FINAL_MOD_FOLDER/$CONTROL_LUA
fi
# unset debug mode in data.lua if it exists
if test -f ./$DIR_NAME/$FINAL_MOD_FOLDER/$DATA_LUA; then
	sed -i -e 's/is_debug_mode = true/is_debug_mode = false/g' ./$DIR_NAME/$FINAL_MOD_FOLDER/$DATA_LUA
fi


# zip the file using 7zip
cd $DIR_NAME
7z a -r $FINAL_MOD_FOLDER'.zip' $FINAL_MOD_FOLDER

#$SHELL