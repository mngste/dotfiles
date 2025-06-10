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

Again, substitute the path to fish for /usr/local/bin/fish - see command -s fish inside fish. To change it back to another shell, just substitute /usr/local/bin/fish with /bin/bash, /bin/tcsh or /bin/zsh as appropriate in the steps above.

## eza on fedora 42

To keep using Eza, I downloaded the latest release from the project’s [Github page](https://github.com/eza-community/eza/releases/), and installed the binary directly to the /usr/local/bin

## brave browser > fedora 42
```bash
sudo dnf install dnf-plugins-core

sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo dnf install brave-browser
```
## zed browser
```bash
curl -f https://zed.dev/install.sh | sh
```
