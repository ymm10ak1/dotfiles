#!/usr/bin/env bash

set -eu

INSTALL_LIST=(git curl build-essential xsel unzip zsh sqlite3 libsqlite3-dev zip wget)
ARCH_INSTALL_LIST=(git curl sqlite3 xsel zip unzip wget rustup)

has() {
  type -p "$1" >/dev/null 2>&1
}

packages_install() {
  # Ubuntu(WSL2)用セットアップ
  if [[ -e /etc/debian_version ]]; then
    if [[ -e /etc/lsb-release ]]; then
      sudo apt-get update -y
      sudo apt-get upgrade -y

      # 必要なソフトウェアのインストール
      for pkg in "${INSTALL_LIST[@]}"; do
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
    fi
  elif [[ -e /etc/arch-release ]]; then
    sudo pacman -Syyu --disable-sandbox
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
  if [[ "$SHELL" =~ "bash" ]]; then
    echo "Change zsh"
    sudo chsh "$(id -un)" -s "$(which zsh)"
  fi
}

packages_install
