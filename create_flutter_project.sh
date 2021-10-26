#! /bin/bash

if [ $# -ne 1 ]; then
  echo "Please give me project name." 1>&2
  exit 1
fi

PROJECT_NAME=$1
PROJECT_PATH=$FLUTTER_PROJECT_DIRECTORY/$PROJECT_NAME

if [ ! -e $FLUTTER_PROJECT_DIRECTORY ]; then
mkdir -p $FLUTTER_PROJECT_DIRECTORY
fi

echo "Creating project..."
flutter create -i swift -a kotlin $PROJECT_PATH

# move to project root
cd $PROJECT_PATH

echo "install riverpod..."
flutter pub add flutter_hooks 
flutter pub add hooks_riverpod

echo "install freezed..."
flutter pub add --dev freezed 
flutter pub add --dev build_runner
flutter pub add freezed_annotation

echo "Open project VS Code..."
code $PROJECT_PATH
