## init chezmoi
```
chezmoi cd
chezmoi init --apply mngste
```

## for fedora
### proton pass cli
```
sudo curl -fsSL https://proton.me/download/pass-cli/install.sh | bash
```
visit [proton-drive-cli](https://proton.me/support/drive-cli)

## for arch or nixos
### install niri
```
sudo pacman -Sy niri
```

### install noctalia v5
```
sudo yay -S noctalia-git
```

#### compositor
[niri v5](https://docs.noctalia.dev/v5/getting-started/compositor-settings/niri/)

### pywalfox

#### install
```
pipx install pywalfox
```
#### add browser extension
```
https://addons.mozilla.org/en-US/firefox/addon/pywalfox/
```
#### in noctalia
`
Open Settings → Color Scheme → Templates → Programs
Toggle on Firefox (Pywalfox)
`
