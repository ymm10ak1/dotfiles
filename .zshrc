# gpg
export GPG_TTY=$(tty)

# mise
if [[ -e /etc/debian_version ]]; then
  eval "$($HOME/.local/bin/mise activate zsh)"
elif [[ -e /etc/arch-release ]]; then
  eval "$(mise activate zsh)"
fi

# aqua
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
export AQUA_GLOBAL_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/aqua/aqua.yaml"
export AQUA_PROGRESS_BAR=true

# sheldon
eval "$(sheldon source)"

# 言語を英語にする
export LANG=en_US.UTF-8

# エディタをnvimにする(nvimがなければvimにする)
if type -p "nvim" > /dev/null 2>&1; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi
export VISUAL=vim

# 履歴
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=10000

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
# コマンドの実行時刻を記録
setopt extended_history

# alias
# alias nv='nvim'
# alias nz='nvim ~/.zshrc'
# alias nzl='nvim ~/.zshrc.local'
# alias sz='source ~/.zshrc'
# alias nt='nvim ~/.tmux.conf'
# alias st='tmux source ~/.tmux.conf'
# alias ojgo='oj t -c "go run main.go" -d ./test/'
# alias ojpy='oj t -c "python3 main.py" -d ./test/'
# alias asp1='acc s main.py -- -l 5063'
# alias a='./a.out'
# alias ain='./a.out < input.txt >| output.txt'
# alias start='explorer.exe'
# alias g='g++ -std=c++23 -O2 -Wall -Wextra'
# alias gg='g++ -g -std=c++23 -O2 -Wall -Wextra'
# alias clip='xsel -bi'

# abbr
if type -p "eza" > /dev/null 2>&1; then
  abbr -S ll='eza -aal -F=always --icons=always --group-directories-first' >>/dev/null
else
  alias ll='ls -alF'
fi
if [[ -e /etc/debian_version ]]; then
  alias uag='sudo apt update && sudo apt upgrade -y'
  alias auc='sudo apt autoremove && sudo apt clean -y'
fi
# >>/dev/nullで標準出力(abbrの起動時メッセージ)を捨てる
abbr -S nv='nvim' >>/dev/null
abbr -S nz='nvim ~/.zshrc' >>/dev/null
abbr -S nzl='nvim ~/.zshrc.local' >>/dev/null
abbr -S sz='source ~/.zshrc' >>/dev/null
abbr -S nt='nvim ~/.tmux.conf' >>/dev/null
abbr -S st='tmux source ~/.tmux.conf' >>/dev/null
abbr -S clip='xsel -bi' >>/dev/null
abbr -S start='explorer.exe' >>/dev/null
# oj
abbr -S ojgo='oj t -c "go run main.go" -d ./test/' >>/dev/null
abbr -S ojpy='oj t -c "python3 main.py" -d ./test/' >>/dev/null
abbr -S asp1='acc s main.py -- -l 5063' >>/dev/null
# cpp
abbr -S a='./a.out' >>/dev/null
abbr -S ain='./a.out < input.txt >| output.txt' >>/dev/null
abbr -S g='g++ -std=c++23 -O2 -Wall -Wextra' >>/dev/null
abbr -S gg='g++ -g -std=c++23 -O2 -Wall -Wextra' >>/dev/null
# git
abbr -S ga='git add' >>/dev/null
abbr -S gb='git branch' >>/dev/null
abbr -S gc='git checkout' >>/dev/null
abbr -S gi='git commit' >>/dev/null
abbr -S gm='git commit -m' >>/dev/null
abbr -S gp='git push' >>/dev/null
abbr -S gss='git status -s' >>/dev/null
abbr -S gsa='git stash -u' >>/dev/null
abbr -S gsl='git stash list' >>/dev/null
abbr -S gsp='git stash pop' >>/dev/null

# functions
function ghq-fzf(){
    local src=$(ghq list | fzf --preview "ls -alF $(ghq root)/{} | awk '{print \$6\"/\"\$7 \" \" \$9\" \"\$10\" \"\$11}'")
    if [ -n "$src" ]; then
        BUFFER="cd $(ghq root)/$src"
        zle accept-line
    fi
    zle -R -c
}
zle -N ghq-fzf
bindkey '^g' ghq-fzf

if type -p "ghq" > /dev/null 2>&1; then
  ATCODER_CPP="$HOME/ghq/github.com/ymm10ak1/atcoder-cpp"
  if [ -d "$ATCODER_CPP" ]; then
    function adcp(){
      "$ATCODER_CPP/adcp.sh"
    }
    function mkcp(){
      "$ATCODER_CPP/mkcp.sh" $1
    }
    function ancp(){
      "$ATCODER_CPP/ancp.sh" $1
    }
    function ojcp(){
      "$ATCODER_CPP/ojcp.sh"
    }
    function recp(){
      "$ATCODER_CPP/recp.sh"
    }
  fi
fi

# online-judge-tools path
export PATH="$HOME/.local/bin:$PATH"

# rust
if [ -e /etc/debian_version ] && [ -e /etc/lsb-release ]; then
 . "$HOME/.cargo/env"
fi

# bat
export BAT_THEME="OneHalfDark"
export BAT_PAGER="less -RF"

# starship
if type -p "starship" > /dev/null 2>&1; then
    eval "$(starship init zsh)"
else
    PROMPT="%n@%~ > "
fi

# zoxide
# "--cmd cd"はzをcdコマンドに置き換える
eval "$(zoxide init zsh)"

# .zshrc_localがあれば読み込み
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
