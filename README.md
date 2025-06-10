# Installation

## wifi
```bash
nmcli device wifi -list
```

```bash
nmcli device wifi connect <SSID> --ask
```

## fish

To change your login shell to fish:

Add the shell to /etc/shells with:

```bash
echo /usr/local/bin/fish | sudo tee -a /etc/shells
```

Change your default shell with:

```bash
chsh -s /usr/local/bin/fish
```

## fisher
```
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

## eza on fedora 42

To keep using Eza, I downloaded the latest release from the project’s [Github page](https://github.com/eza-community/eza/releases/), and installed the binary directly to the /usr/local/bin

## flatpak
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

## fonts
```
dnf search fonts
```
```
sudo dnf install jetbrains...
```
