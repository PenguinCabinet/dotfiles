#!/bin/bash

DIR="$(cd -- "$(dirname -- "$0")" && pwd)"

for pkg in vim wezterm bash zsh tmux i3 "Do-not-use-PC"; do
	# 既にファイルが存在する場合、上書きするかパッケージ単位で聞く。Yesの場合、すべて削除
	rm_flag=false
	for src in "$DIR/$pkg"/.[!.]*; do
		dst="$HOME/${src##*/}"

		if  ! $rm_flag && [[ -e "$dst" || -L "$dst" ]]; then
		    read -rp "$pkgの設定ファイルを上書きしますか？ [Yes/No]: " ans
		    if [[ "$ans" =~ ^([Yy]|[Yy][Ee][Ss])$ ]]; then
		    	rm_flag=true
		    fi
		fi

		if $rm_flag; then
		    rm -rf -- "$dst"
		fi
	done

	stow -d "$DIR" -t "$HOME" "$pkg" && continue
done

#stow -v vim wezterm bash zsh tmux i3 "Do-not-use-PC"
