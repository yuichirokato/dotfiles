export LC_ALL=en_US.UTF-8

MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: setup
setup: # ローカル環境のセットアップ
	make deploy-dotfiles
	make install-homebrew
	make install-ruby
	make install-cocoapods

.PHONY: deploy-dotfiles
deploy-dotfiles:
	sh ${MAKEFILE_DIR}/install.sh

.PHONY: install-homebrew
install-homebrew: # hombrew と brew を使ったコマンドやツールのインストール
	sh ${MAKEFILE_DIR}/homebrew_install.sh

.PHONY: install-ruby
install-ruby: 
	sh ${MAKEFILE_DIR}/ruby_install.sh

.PHONY: install-cocoapods
install-cocoapods:
	sh ${MAKEFILE_DIR}/cocoapods_install.sh