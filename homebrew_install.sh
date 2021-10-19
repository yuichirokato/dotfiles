#! /bin/bash

### メモ
# さきにApp storeにログインしておく
# install.shを実行しておく

echo "不可視ファイルを可視化します"
defaults write com.apple.finder AppleShowAllFiles TRUE

echo "Command Line Tools for Xcodeのインストールをします"
xcode-select --install

### homebrew
echo "homebrewをインストールしています"
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "brew doctorを実行しています"
which brew >/dev/null 2>&1 && brew doctor

echo "run brew updateを行います"
which brew >/dev/null 2>&1 && brew update --verbose

echo "homebrew周りの設定が終了しました"

echo ".Brewfileに記載されているアプリをインストールします"
brew bundle --global --verbose
