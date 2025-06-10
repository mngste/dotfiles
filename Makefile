stow = cd config && stow -v -t ~

install:
	xargs -d '\n' -a packages/package.list dnf install -y

flatpak:
	xargs -d '\n' -a packages/flatpak.list flatpak install flathub

dotfiles:
	$(stow) fish
	$(stow) wofi
	$(stow) nvim
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
