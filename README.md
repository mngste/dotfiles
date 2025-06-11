# Installation

## wifi
```bash
nmcli device wifi -list
```

```bash
nmcli device wifi connect <SSID> --ask
```
### RESOLVE WIFI AUTOCONNECT
1. Install iwd
```
sudo dnf install -y iwd
sudo mkdir -p /etc/iwd
```
2. Add these contents to /etc/iwd/main.conf:
```conf
[General]
EnableNetworkConfiguration=true
UseDefaultInterface=true

[Network]
NameResolvingService=systemd
```
3.
```
sudo systemctl start iwd
sudo systemctl enable iwd
```
4. Add this to /etc/NetworkManager/conf.d/wifi_backend.conf:
```
[device]
wifi.backend=iwd
````
6.
```
sudo systemctl restart NetworkManager
```
7. Run <code>iwctl</code>  
type <code>station list</code> to find your interface  
type <code>station <your_interface> get-networks</code>  
type <code>station <your_interface> connect <your-network></code>  
exit iwctl.  
Your wifi password will be saved now.

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
```
kitty +list-fonts | fzf 
```
