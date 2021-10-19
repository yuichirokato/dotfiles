# Prompt
if [ $UID -eq 0 ];then
# ルートユーザーの場合
PROMPT="%F{red}%n:%f%F{green}%d%f [%m] %%
"
else
# ルートユーザー以外の場合
PROMPT="%F{cyan}%n:%f%F{green}%d%f [%m] %%
"
fi

# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'


# rbenv path
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias carthage_bootstrap="carthage bootstrap --platform iOS --no-use-binaries"

# Workflow editor
export PORT="8080"

# RealmBrowser
if [ `uname` = "Darwin" ]; then
    alias open-realm="open $(find ~/Library/Developer/CoreSimulator/Devices/82265074-09C4-4563-B59F-6144B6313469/data/Containers/Data/Application -name \*.realm)"
fi

# Git
# 補完機能有効にする
autoload -U compinit
compinit -u

# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go
export GOPATH="$HOME/.go"

# nvm
source $(brew --prefix nvm)/nvm.sh

# flutter
export PATH="$HOME/Documents/Flutter/sdk/flutter/bin:$PATH"

# rust
source ~/.cargo/env

# dart
export PATH="$PATH":"$HOME/.pub-cache/bin"

# LC_ALL
export LC_ALL="en_US.UTF-8"

# Java, Android                                                                                                                                                                                            
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
PATH=${JAVA_HOME}/bin:${PATH}
 
export ANDROID_HOME="$HOME/Library/Android/sdk/"
export PATH=$ANDROID_HOME/platform-tools:${PATH}
export PATH=$ANDROID_HOME/tools:${PATH}
export PATH=$ANDROID_HOME/tools/bin:${PATH}
export PATH=$ANDROID_HOME/build-tools/29.0.5:${PATH}

# Alias
alias home='cd ~'
alias edit-zshrc='vim ~/.zshrc'
alias pod-install='bundle exec pod install'
alias update-zshrc='source ~/.zshrc'
