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

# alias
alias ll='exa -aalF --icons --group-directories-first'
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
export PATH=$PATH:/usr/local/go/bin

# nvm node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

# sheldon
eval "$(sheldon source)"
