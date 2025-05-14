#!/usr/bin/env bash

set -eu

UBUNTU_INSTALL_LIST=(git curl build-essential xsel unzip zip zsh wget pandoc poppler-utils ffmpeg libreadline-dev)
ARCH_INSTALL_LIST=(git curl xsel zip unzip wget rustup gcc mise zsh less which make)

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

      # miseのインストール
      if ! (has "mise"); then
        echo "Install mise"
        curl https://mise.run | sh
        "$HOME/.local/bin/mise" --version
      else
        echo "mise is already installed"
      fi
    fi
  elif [[ -e /etc/arch-release ]]; then
    sudo pacman -Syyu

    for pkg in "${ARCH_INSTALL_LIST[@]}"; do
      sudo pacman -S --noconfirm --needed "$pkg"
    done
  fi

  # aquaのインストール
  if ! (has "aqua"); then
    echo "Install aqua"
    curl -sSfL -O https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.1.2/aqua-installer
    echo "9a5afb16da7191fbbc0c0240a67e79eecb0f765697ace74c70421377c99f0423  aqua-installer" | sha256sum -c -
    chmod +x aqua-installer
    ./aqua-installer
  else
    echo "aqua is already installed"
  fi

  # シェルをbashからzshに変更
  if [[ "$SHELL" =~ bash$ ]]; then
    echo "Change zsh"
    sudo chsh "$(id -un)" -s "$(which zsh)"
  fi
}

install_packages
