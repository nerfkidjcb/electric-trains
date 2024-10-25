#!/bin/sh

# Initialize constants./build.sh
CONSTANT_NAME="electric-trains-github-output.zip"

# Check for the -g argument
USE_CONSTANT_NAME=false

while getopts "g" opt; do
  case $opt in
    g)
      USE_CONSTANT_NAME=true
      ;;
    *)
      echo "Usage: $0 [-g]"
      exit 1
      ;;
  esac
done

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

if [ "$USE_CONSTANT_NAME" = true ]; then
  FINAL_MOD_FOLDER=$CONSTANT_NAME
else
  FINAL_MOD_FOLDER="${MODNAME}_${VERSION}.zip"
fi

# Remove old build directory
if [ -d "$DIR_NAME" ]; then
  echo "Removing old build directory..."
  rm -rf "$DIR_NAME"
fi

# Remove old archive
if [ -f "$FINAL_MOD_FOLDER" ]; then
  echo "Removing old zip file..."
  rm "$FINAL_MOD_FOLDER"
fi

# Create new build directory
mkdir -p ./"$DIR_NAME/${FINAL_MOD_FOLDER%.zip}"

echo "Copying files to build directory..."
# Copy files into the new directory
# - not the new build directory
# - not the build script
# - not .git
# - not .gitignore
# - not .documentation
# - not .vscode
find . -maxdepth 1 ! -regex ".*/$DIR_NAME" ! -regex ".*/$BUILDER_NAME" ! -regex ".*/$GIT" ! -regex ".*/$GITIGNORE" ! -regex ".*/$DOCUMENTATION" ! -regex ".*/$VSCODE" ! -regex '.' ! -regex '.*.zip' -exec cp -r '{}' "$DIR_NAME/${FINAL_MOD_FOLDER%.zip}" \;

echo "Running pngquant on png files..."
# run pngquant on the png files
find ./"$DIR_NAME/${FINAL_MOD_FOLDER%.zip}" -name '*.png' -print0 | xargs -0 -P5 -L1 pngquant --ext .png --force 256

# zip the file using 7zip
7z a -r "$FINAL_MOD_FOLDER" ./"$DIR_NAME/${FINAL_MOD_FOLDER%.zip}"

echo "Electric Trains mod build complete!"
