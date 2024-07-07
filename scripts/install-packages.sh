#!/bin/bash

set -eu

INSTALL_LIST=(git curl exa build-essential xsel bat ripgrep unzip zsh sqlite3 libsqlite3-dev zip)

has() {
  type -p "$1" >/dev/null 2>&1
}

packages_install() {
  # Ubuntu(WSL2)用セットアップ
  if [[ -e /etc/debian_version ]]; then
    if [[ -e /etc/lsb-release ]]; then
      sudo apt-get update -y
      sudo apt-get upgrade -y

      # git,curl,exa,xsel,build-essential,bat,ripgrep等のインストール
      for pkg in "${INSTALL_LIST[@]}"; do
        local pkg_name="$pkg"
        if [[ "$pkg" = "ripgrep" ]]; then
          pkg_name="rg"
        elif [[ "$pkg" = "build-essential" ]]; then
          pkg_name="gcc"
        elif [[ "$pkg" = "bat" ]]; then
          pkg_name="batcat"
        fi
        if ! (has "$pkg_name"); then
          sudo apt-get install -y "$pkg"
        else
          echo "$pkg is already installed"
        fi
      done

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
        sudo -v && curl -sS https://starship.rs/install.sh | sh
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
      # miseのインストール
      if ! (has "mise"); then
        echo "Install mise"
        curl https://mise.run | sh
        "$HOME/.local/bin/mise" --version
      else
        echo "mise is already installed"
      fi

      # シェルをbashからzshに変更
      if [[ "$SHELL" =~ "bash" ]]; then
        echo "Change zsh"
        chsh -s "$(which zsh)"
      fi
    fi
  fi
}

packages_install
