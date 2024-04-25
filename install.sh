#!/bin/bash

# -u: 未定義の変数を使おうとしたときにエラー終了する
# -e: エラーがあったらシェルスクリプトをそこで終了する
set -ue

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd -P)

create_symlink_dotfiles() {
    command echo "backup old dotfiles..."
    if [ ! -d "$HOME/.dotbackup" ]; then
        command echo "$HOME/.dotbackup not found. Auto Make it"
        command mkdir -v "$HOME/.dotbackup"
    fi

    local dot_dir="${SCRIPT_DIR}"
    if [[ "$HOME" != "$dot_dir" ]]; then
        for file in $dot_dir/.??*; do
            [[ `basename $file` == ".git" ]] && continue
            [[ `basename $file` == ".gitignore" ]] && continue
            [[ `basename $file` == ".config" ]] && continue
            if [[ -L "$HOME/`basename $file`" ]]; then
                command rm -f "$HOME/`basename $file`"
            fi
            if [[ -e "$HOME/`basename $file`" && ! -L "$HOME/`basename $file`" ]]; then
                command mv "$HOME/`basename $file`" "$HOME/.dotbackup"
            fi
            command ln -snfv $file $HOME
        done
    else
        command echo "same install src dest"
    fi
}

create_symlink_config() {
    command echo "backup old dotconfig..."
    if [ ! -d "$HOME/.dotbackup/.config" ]; then
        command echo "$HOME/.dotbackup/.config not found. Auto Make it"
        command mkdir -pv "$HOME/.dotbackup/.config"
    fi

    if [ ! -d "$HOME/.config" ]; then
        command echo "$HOME/.config not found. Auto Make it"
        command mkdir -v "$HOME/.config"
    fi

    local config_dir="${SCRIPT_DIR}/.config"
    local home_config="$HOME/.config"
    if [[ "$HOME" != "$config_dir" ]]; then
        for file in $config_dir/??*; do
            if [ -d $file ]; then
                [[ `basename $file` = ".git" ]] && continue
                if [[ -L "$home_config/`basename $file`" ]]; then
                    command rm -f "$home_config/`basename $file`"
                fi
                if [[ -e "$home_config/`basename $file`" && ! -L "$home_config/`basename $file`" ]]; then
                    command mv "$home_config/`basename $file`" "$HOME/.dotbackup/.config"
                fi
                command ln -snfv $file $home_config
            fi
        done
    else
        command echo "same install src dest"
    fi
}

command echo -e "\033[1;32mInstalling dotfiles...\033[0m"
create_symlink_dotfiles
command echo -e "\033[1;32mInstalling config file...\033[0m"
create_symlink_config
command echo -e "\033[1;36mInstalling completed!\033[0m"
