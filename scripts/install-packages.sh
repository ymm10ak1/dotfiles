#!/bin/bash

set -eu

INSTALL_LIST=(git curl exa build-essential xsel bat ripgrep unzip zsh)

has() {
  type -p "$1" >/dev/null 2>&1
}

packages_install() {
  # Ubuntu(WSL2)用セットアップ
  if [[ -e /etc/debian_version ]]; then
    if [[ -e /etc/lsb-release ]]; then
      sudo apt-get update -y
      sudo apt-get upgrade -y

      # git,curl,exa,xsel,build-essential,bat,ripgrepのインストール
      for pkg in "${INSTALL_LIST[@]}"; do
        if [[ "$pkg" = "ripgrep" ]]; then
          pkg="rg"
        elif [[ "$pkg" = "build-essential" ]]; then
          pkg="gcc"
        elif [[ "$pkg" = "bat" ]]; then
          pkg="batcat"
        fi
        if ! (has $pkg); then
          sudo apt-get install -y $pkg
        else
          echo "$pkg is already installed"
        fi
      done

      # nvm,nodejsのインストール
      if ! (command -v nvm >/dev/null); then
        echo "nvm is already installed"
      else
        echo "Install nvm"
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
        # nvmがインストールできたらnodejsのインストール
        if ! (command -v nvm >/dev/null); then
          nvm install --lts
        fi
      fi
      #denoのインストール
      if ! (has "deno"); then
        echo "Install deno"
        curl -fsSL https://deno.land/install.sh | sh
      else
        echo "deno is already installed"
      fi
      # fzfのインストール(aptだとバージョンが古いのでgitを使う)
      if ! (has "fzf"); then
        echo "Install fzf"
        local fzf_dir="$HOME/.fzf"
        git clone --depth 1 https://github.com/junegunn/fzf.git "$fzf_dir"
        "$fzf_dir"/install
      else
        echo "fzf is already installed"
      fi
      # zoxideのインストール
      if ! (has "zoxide"); then
        echo "Install zoxide"
        curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
      else
        echo "zoxide is already installed"
      fi
      # starshipのインストール
      if ! (has "starship"); then
        echo "Install starship"
        curl -sS https://starship.rs/install.sh | sh
      else
        echo "starship is already installed"
      fi
      # rustのインストール
      if ! (has "rustup"); then
        echo "Install rust"
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
      else
        echo "rust is already installed"
      fi
      # sheldonのインストール
      if ! (has "sheldon"); then
        echo "Install sheldon"
        curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh |
          bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
      else
        echo "sheldon is already installed"
      fi

      # シェルをzshに変更
      echo "Change zsh"
      sudo chsh -s $(which zsh)
    fi
  fi
}

packages_install
