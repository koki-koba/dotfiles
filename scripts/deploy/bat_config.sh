#!/bin/zsh
if type "bat" > /dev/null 2>&1; then
	echo "Create link to config directory."
	ln -snfv $DOTFILES/config/bat $(bat --config-dir)
	echo ""
else
	echo "bat not found"
	exit
fi