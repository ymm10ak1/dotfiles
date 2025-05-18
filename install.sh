#!/usr/bin/env bash

# -u: 未定義の変数を使おうとしたときにエラー終了する
# -e: エラーがあったらシェルスクリプトをそこで終了する
set -ue

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd -P)

create_symlink_dotfiles() {
  local dot_dir="${SCRIPT_DIR}"
  if [[ "$HOME" != "$dot_dir" ]]; then
    for file in "$dot_dir"/.??*; do
      [[ $(basename "$file") == ".git" ]] && continue
      [[ $(basename "$file") == ".github" ]] && continue
      [[ $(basename "$file") == ".gitignore" ]] && continue
      [[ $(basename "$file") == ".config" ]] && continue
      if [[ -L "$HOME/$(basename "$file")" ]]; then
        command unlink "$HOME/$(basename "$file")"
      elif [[ -e "$HOME/$(basename "$file")" ]]; then
        command rm "$HOME/$(basename "$file")"
      fi
      command ln -snfv "$file" "$HOME"
    done
  else
    command echo "same install src dest"
  fi
}

create_symlink_config() {
  if [ ! -d "$HOME/.config" ]; then
    command echo "$HOME/.config not found. Auto Make it"
    command mkdir -v "$HOME/.config"
  fi

  local config_dir="${SCRIPT_DIR}/.config"
  local home_config="$HOME/.config"
  if [[ "$HOME" != "$config_dir" ]]; then
    for file in "$config_dir"/??*; do
      # ディレクトリまたは通常のファイルの場合はシンボリックリンクを作る
      if [[ -d "$file" || -f "$file" ]]; then
        [[ $(basename "$file") == ".git" ]] && continue
        # wsl2の場合はweztermのシンボリックリンクは作らない
        if [[ "$(uname -r)" == *microsoft* ]]; then
          [[ $(basename "$file") == "wezterm" ]] && continue
        fi
        if [[ -L "$home_config/$(basename "$file")" ]]; then
          command unlink "$home_config/$(basename "$file")"
        elif [[ -e "$home_config/$(basename "$file")" ]]; then
          command rm "$home_config/$(basename "$file")"
        fi
        command ln -snfv "$file" "$home_config"
      fi
    done
  fi
}

command echo -e "\033[1;36mInstalling packages...\033[0m"
chmod 755 "$SCRIPT_DIR/scripts/install-packages.sh"
"$SCRIPT_DIR/scripts/install-packages.sh"
command echo -e "\033[1;36mCreating symbolic link...\033[0m"
create_symlink_dotfiles
create_symlink_config
command echo -e "\033[1;32mInstall completed!\033[0m"
