#!/usr/bin/env bash

# -u: 未定義の変数を使おうとしたときにエラー終了する
# -e: エラーがあったらシェルスクリプトをそこで終了する
set -ue

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd -P)
BACKUP_DATE=$(date "+%Y%m%d-%H%M%S")

create_symlink_dotfiles() {
  command echo "$BACKUP_DATE backup old dotfiles..."
  if [ ! -d "$HOME/.dotbackup/$BACKUP_DATE" ]; then
    command echo "$HOME/.dotbackup/$BACKUP_DATE not found. Auto Make it"
    command mkdir -pv "$HOME/.dotbackup/$BACKUP_DATE"
  fi

  local dot_dir="${SCRIPT_DIR}"
  local backup_dir="$HOME/.dotbackup/$BACKUP_DATE"
  if [[ "$HOME" != "$dot_dir" ]]; then
    for file in "$dot_dir"/.??*; do
      [[ $(basename "$file") == ".git" ]] && continue
      [[ $(basename "$file") == ".github" ]] && continue
      [[ $(basename "$file") == ".gitignore" ]] && continue
      [[ $(basename "$file") == ".config" ]] && continue
      if [[ -L "$HOME/$(basename "$file")" ]]; then
        command unlink "$HOME/$(basename "$file")"
      fi
      if [[ -e "$HOME/$(basename "$file")" && ! -L "$HOME/$(basename "$file")" ]]; then
        command mv "$HOME/$(basename "$file")" "$backup_dir"
      fi
      command ln -snfv "$file" "$HOME"
    done
  else
    command echo "same install src dest"
  fi
}

create_symlink_config() {
  command echo "backup old dotconfig..."
  if [ ! -d "$HOME/.dotbackup/$BACKUP_DATE/.config" ]; then
    command echo "$HOME/.dotbackup/$BACKUP_DATE/.config not found. Auto Make it"
    command mkdir -pv "$HOME/.dotbackup/$BACKUP_DATE/.config"
  fi

  if [ ! -d "$HOME/.config" ]; then
    command echo "$HOME/.config not found. Auto Make it"
    command mkdir -v "$HOME/.config"
  fi

  local config_dir="${SCRIPT_DIR}/.config"
  local home_config="$HOME/.config"
  local backup_config_dir="$HOME/.dotbackup/$BACKUP_DATE/.config"
  if [[ "$HOME" != "$config_dir" ]]; then
    for file in "$config_dir"/??*; do
      # ディレクトリまたは通常のファイルの場合はシンボリックリンクを作る
      if [[ -d "$file" || -f "$file" ]]; then
        [[ $(basename "$file") = ".git" ]] && continue
        # wsl2の場合はweztermのシンボリックリンクは作らない
        if [[ "$(uname -r)" == *microsoft* ]]; then
          [[ $(basename "$file") = "wezterm" ]] && continue
        fi
        if [[ -L "$home_config/$(basename "$file")" ]]; then
          command unlink "$home_config/$(basename "$file")"
        fi
        if [[ -e "$home_config/$(basename "$file")" && ! -L "$home_config/$(basename "$file")" ]]; then
          command mv "$home_config/$(basename "$file")" "$backup_config_dir"
        fi
        command ln -snfv "$file" "$home_config"
      fi
    done
  else
    command echo "same install src dest"
  fi
}

# aqua_pkg_install(){
#   command echo -e "\033[1;36mInstalling aqua packages...\033[0m"
#   aqua i -l -a
# }
#
# mise_pkg_install(){
#   command echo -e "\033[1;36mInstalling mise packages...\033[0m"
#   mise i
# }

run_script() {
  if [[ -f "$1" ]]; then
    source "$1"
  else
    echo "$1 is not exist"
  fi
}

command echo -e "\033[1;36mInstalling packages...\033[0m"
run_script "$SCRIPT_DIR/scripts/install-packages.sh"
command echo -e "\033[1;36mCreating symbolic link...\033[0m"
create_symlink_dotfiles
create_symlink_config
command echo -e "\033[1;32mInstall completed!\033[0m"
