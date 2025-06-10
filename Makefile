.PHONY: xfce install installdev installi3

stow = cd config && stow -v -t ~

install:
	xargs -d '\n' -a packages/package.list dnf install -y

dotfiles:
	xrdb ~/.Xresources
	$(stow) fish
	$(stow) wofi
	$(stow) vim
	$(stow) gitnow
	$(stow) bin
	$(stow) git
	$(stow) brave
	$(stow) zed
	mv ~/gitignore ~/.gitignore

dd:
	$(stow) code

hyprland:
	$(stow) hyprland
