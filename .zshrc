# 言語を日本語にする
export LANG=ja_JP.UTF-8

# エディタをvimにする
export EDITOR=vim

# 履歴
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=2000

# 重複するコマンドを記録しない
setopt hist_ignore_dups
# 履歴に追加されるコマンドがすでにあるなら古い方を削除
setopt hist_ignore_all_dups
# <TAB>で順に補完候補を切り替える
setopt auto_menu
# コマンドのスペルチェックを行う
setopt correct
# 上書きリダイレクトの禁止
setopt no_clobber
# 日本語ファイル名等8ビットを通す
setopt print_eight_bit

# alias
if type -p "eza" > /dev/null 2>&1; then
    alias ll='eza -aalF --icons --group-directories-first'
else
    alias ll='ls -alF'
fi
alias udaug='sudo apt update && sudo apt upgrade -y'
alias auc='sudo apt autoremove && sudo apt clean -y'
alias nv='nvim'
alias nz='nvim ~/.zshrc'
alias nzl='nvim ~/.zshrc.local'
alias sz='source ~/.zshrc'
alias ojgo='oj t -c "go run main.go" -d ./test/'
alias ojpy='oj t -c "python3 main.py" -d ./test/'
alias asp1='acc s main.py -- -l 5063'
alias bat='batcat'
alias a='./a.out'
alias ain='./a.out < input.txt >| output.txt'
alias nt='nvim ~/.tmux.conf'
alias tst='tmux source ~/.tmux.conf'
alias start='explorer.exe'

# GOPATH
# export PATH=$PATH:/usr/local/go/bin

# online-judge-tools path
export PATH="$HOME/.local/bin:$PATH"

# rust
. "$HOME/.cargo/env"

# bat
export BAT_THEME="OneHalfDark"
export BAT_PAGER="less -RF"

# deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# starship
eval "$(starship init zsh)"

# zoxide
# "--cmd cd"はzをcdコマンドに置き換える
eval "$(zoxide init --cmd cd zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# .zshrc_localがあれば読み込み
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# mise
eval "$($HOME/.local/bin/mise activate zsh)"

# neovim
if [ -d /opt/nvim-linux64 ]; then
    export PATH="$PATH:/opt/nvim-linux64/bin"
    # neovimとfzfがあればfzfで検索した結果をneovimで編集
    if type -p "fzf" > /dev/null 2>&1; then
        alias nvf='nvim $(fzf)'
    fi
fi

# sheldon
eval "$(sheldon source)"
