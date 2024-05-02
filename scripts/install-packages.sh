#!/bin/bash 

set -eu

INSTALL_LIST=(git curl exa build-essential xsel bat)

has() {
    type -p "$1" > /dev/null 2>&1
}

packages_install(){
    # Ubuntu(WSL2)用セットアップ
    if [[ -e /etc/debian_version ]]; then
        if [[ -e /etc/lsb-release ]]; then
            sudo apt-get update -y
            sudo apt-get upgrade -y

            # git,curl,exa,build-essential,xselのインストール
            for pkg in "${INSTALL_LIST[@]}"; do 
                if ! ( has $pkg ); then
                    sudo apt-get install -y $pkg
                else
                    echo "$pkg is already installed"
            done

            # nvm,nodejsのインストール
            if ! ( command -v nvm > /dev/null ); then
                echo "nvm is already installed"
            else
                echo "Install nvm"
                curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
                # nvmがインストールできたらnodejsのインストール
                if ! ( command -v nvm > /dev/null ); then
                    nvm install --lts
                fi
            fi
            #denoのインストール
            if ! ( has "deno" ); then
                echo "Install deno"
                curl -fsSL https://deno.land/install.sh | sh
            else
                echo "deno is already installed"
            fi
            # fzfのインストール(aptだとバージョンが古いのでgitを使う)
            if ! ( has "fzf" ); then
                echo "Install fzf"
                local fzf_dir="$HOME/.fzf"
                git clone --depth 1 https://github.com/junegunn/fzf.git "$fzf_dir"
                "$fzf_dir"/install
            else
                echo "fzf is already installed"
            fi
            # zoxideのインストール
            if ! ( has "zoxide" ); then
                echo "Install zoxide"
                curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
                local zshrc_dir="$HOME/.zshrc"
                if ! ( command -v zsh > /dev/null ); then
                    if [ -e "$zshrc_dir" ]; then
                        echo 'eval "$(zoxide init --cmd cd zsh)"' >> $zshrc_dir
                    fi
                fi
                local bashrc_dir="$HOME/.bashrc"
                if ! ( command -v bash > /dev/null ); then
                    if [ -e "$bashrc_dir" ]; then
                        echo 'eval "$(zoxide init --cmd cd bash)"' >> $bashrc_dir
                    fi
                fi
            else
                echo "zoxide is already installed"
            fi
        fi
    fi
}

packages_install
