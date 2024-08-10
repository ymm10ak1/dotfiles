#!/bin/bash

set -eu

TARGET="$HOME/.dotbackup"

backup_check() {
  for dname in "$TARGET"/*; do
    [[ $(basename "$dname") == ".config" ]] && continue
    if [[ -d "$dname" ]]; then
      echo -e "\033[1;32mCheck\033[m $dname"
      local size
      size="$(du -ah "$dname" | awk "END {print NR}")"
      # 何もバックアップしていないディレクトリを削除
      if [[ "$size" == 2 ]]; then
        echo -e "\033[1;31mRemove\033[m $dname"
        rm -r "$dname"
      fi
    fi
  done
}

backup_check
