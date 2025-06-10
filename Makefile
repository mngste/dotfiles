stow = cd config && stow -v -t ~

install:
	xargs -d '\n' -a packages/package.list dnf install -y

flatpak:
	xargs -d '\n' -a packages/flatpak.list flatpak install flathub

fisher:
	xargs -d '\n' -a packages/fisher.list fisher install

dotfiles:
	$(stow) fish
	$(stow) nvim
	$(stow) gitnow
	$(stow) bin
	$(stow) git
	$(stow) zed
	mv ~/gitignore ~/.gitignore

dd:
	$(stow) code

hyprland:
	$(stow) hyprland --adopt
