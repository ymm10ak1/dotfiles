#!/usr/bin/env bash

set -eu

UBUNTU_INSTALL_LIST=(git curl build-essential xsel unzip zip zsh wget pandoc poppler-utils ffmpeg libreadline-dev)
ARCH_INSTALL_LIST=(git curl xsel zip unzip wget rustup)

has() {
  type -p "$1" >/dev/null 2>&1
}

install_packages() {
  if [[ -e /etc/debian_version ]]; then
    if [[ -e /etc/lsb-release ]]; then
      sudo apt-get update -y
      sudo apt-get upgrade -y

      # 必要なソフトウェアのインストール
      for pkg in "${UBUNTU_INSTALL_LIST[@]}"; do
        local pkg_name="$pkg"
        if [[ "$pkg" = "build-essential" ]]; then
          pkg_name="gcc"
        fi
        if ! (has "$pkg_name"); then
          sudo apt-get install -y "$pkg"
        else
          echo "$pkg is already installed"
        fi
      done

      # rustのインストール
      if ! (has "rustup"); then
        echo "Install rust"
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
      else
        echo "rust is already installed"
      fi

      # neovimのインストール
      if ! (has "nvim"); then
        echo "Install neovim"
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
        if [[ -d /opt/nvim ]]; then
          sudo rm -rf /opt/nvim
        elif [[ -d /opt/nvim-linux64 ]]; then
          sudo rm -rf /opt/nvim-linux64
        elif [[ -d /opt/nvim-linux-x86_64 ]]; then
          sudo rm -rf /opt/nvim-linux-x86_64
        fi
        sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
      else
        echo "neovim is already installed"
      fi
    fi
  elif [[ -e /etc/arch-release ]]; then
    # wsl-archの場合は--disable-sandboxオプションをつける
    if [[ "$(uname -r)" == *microsoft* ]]; then
      sudo pacman -Syyu --disable-sandbox
    else
      sudo pacman -Syyu
    fi
    for pkg in "${ARCH_INSTALL_LIST[@]}"; do
      sudo pacman -S --noconfirm --needed "$pkg"
    done
  fi

  # aquaのインストール
  if ! (has "aqua"); then
    echo "Install aqua"
    curl -sSfL -O https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.0.1/aqua-installer
    echo "fb4b3b7d026e5aba1fc478c268e8fbd653e01404c8a8c6284fdba88ae62eda6a  aqua-installer" | sha256sum -c
    chmod +x aqua-installer
    ./aqua-installer
  else
    echo "aqua is already installed"
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
  if [[ "$SHELL" =~ bash$ ]]; then
    echo "Change zsh"
    sudo chsh "$(id -un)" -s "$(which zsh)"
  fi
}

install_packages
