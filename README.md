## init chezmoi
```
chezmoi cd
chezmoi init --apply mngste
```
## install niri
```
sudo dnf install niri
```

## install noctalia
```
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
```
```
sudo dnf install noctalia-shell
```
### activate
```
systemctl --user add-wants niri.service noctalia-shell
```
### compositor
[niri](https://docs.noctalia.dev/v4/getting-started/compositor-settings/niri/)

## pywalfox

### install
```
pipx install pywalfox
```
### add browser extension
```
https://addons.mozilla.org/en-US/firefox/addon/pywalfox/
```
### in noctalia
`
Open Settings → Color Scheme → Templates → Programs
Toggle on Firefox (Pywalfox)
`
