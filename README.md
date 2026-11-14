# dotfiles

Mes fichiers de configuration, gérés avec [chezmoi](https://www.chezmoi.io/).
Testés sur **Fedora** et **Arch Linux** (bureau niri + noctalia), utilisables aussi sur des serveurs **Debian/Ubuntu**.

Thème partout : **Tokyo Night** · police : **JetBrainsMono Nerd Font**.

## Installation

Sur une nouvelle machine, une seule commande : elle installe chezmoi, clone le dépôt et applique tout.

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply mngste
```

Depuis un clone existant du dépôt : `./install.sh`.

Au premier lancement, chezmoi demande si la machine est **headless** (sans écran) et **ephemeral** (VM, conteneur, machine jetable). Ces réponses décident de ce qui est installé (voir [Profils de machine](#profils-de-machine)).

### Au quotidien

```sh
chezmoi update        # récupère les changements du dépôt et les applique
chezmoi edit ~/.zshrc # modifie un fichier dans le dépôt
chezmoi diff          # ce qui changerait avant d'appliquer
chezmoi apply         # applique
chezmoi cd            # ouvre un shell dans le dépôt
```

`git.autoCommit` est activé : chaque `chezmoi edit`/`add` crée un commit local, à pousser ensuite.

## Contenu

| Outil | Rôle | Config |
|---|---|---|
| [kitty](https://sw.kovidgoyal.net/kitty/) | Terminal | `~/.config/kitty/` |
| [zsh](https://www.zsh.org/) + [starship](https://starship.rs/) | Shell et prompt | `~/.zshrc`, `~/.config/starship/` |
| [helix](https://helix-editor.com/) | Éditeur (par défaut) | `~/.config/helix/` |
| [yazi](https://yazi-rs.github.io/) | Gestionnaire de fichiers en terminal | `~/.config/yazi/` |
| [btop](https://github.com/aristocratos/btop), [fastfetch](https://github.com/fastfetch-cli/fastfetch) | Monitoring, infos système | `~/.config/btop/`, `~/.config/fastfetch/` |
| [nb](https://github.com/xwmx/nb) | Notes et favoris en ligne de commande | `~/.nbrc` |
| [niri](https://github.com/YaLTeR/niri) | Gestionnaire de fenêtres Wayland (défilement) | `~/.config/niri/` |
| [sway](https://swaywm.org/) | Gestionnaire de fenêtres Wayland (tiling), sur Fedora | `~/.config/sway/config.d/` |
| [noctalia](https://docs.noctalia.dev/) | Barre, notifications, fonds d'écran (lancé par niri) | — |
| fuzzel | Lanceur d'applications | `~/.config/fuzzel/` |
| waybar, mako | Barre (niri : `config.jsonc`, Sway : `sway.jsonc`) et notifications | `~/.config/waybar/`, `~/.config/mako/` |
| alacritty, ghostty | Anciens terminaux, configs gardées | `~/.config/alacritty/`, `~/.config/ghostty/` |

Fonds d'écran Tokyo Night dans [`assets/`](assets/). Sous Sway, `~/.local/share/backgrounds/wallpaper.jpg` est un lien vers l'un d'eux (à changer dans `dot_local/share/backgrounds/symlink_wallpaper.jpg.tmpl`).

### Shell (zsh)

`~/.bashrc` bascule automatiquement sur zsh s'il est installé.

- Plugins (téléchargés par chezmoi, voir `.chezmoiexternal.toml`) : autosuggestions, syntax-highlighting, history-substring-search, completions.
- Outils : zoxide, fzf + fd (aperçu avec bat), eza à la place de `ls`, bat à la place de `cat`.
- Alias principaux :

| Alias | Commande |
|---|---|
| `h`, `fh` | helix, helix sur un fichier choisi avec fzf |
| `update`, `install`, `remove`, `search` | dnf (Fedora) ou yay (Arch) |
| `y` | yazi (reste dans le dossier quitté) |
| `ll`, `la`, `tree` | eza |
| `g`, `gs`, `gc`, `gp`, `lg` | git, lazygit |
| `d`, `dps`, `dcu`, `dcd` | docker / docker compose |
| `k`, `kl`, `kn`, `kc` | kubectl, kubens, kubectx |
| `sc` / `ec` | recharger / éditer `.zshrc` |

- Raccourcis : `Ctrl+F` sélecteur de fichiers fzf, `↑`/`↓` recherche dans l'historique, `Ctrl+\` active/désactive les suggestions.

### Terminal (kitty)

| Raccourci | Action |
|---|---|
| `Ctrl+Shift+H/J/K/L` | Nouveau split à gauche / en bas / en haut / à droite |
| `Ctrl+Alt+H/J/K/L` | Aller au split voisin |
| `Ctrl+Shift+Z` | Split courant en plein écran (on/off) |
| `Ctrl+Shift+W` | Fermer le split |
| `Ctrl+Shift+T` / `Super+←/→` | Nouvel onglet / onglet précédent, suivant |
| `Super+Shift+T` | Renommer l'onglet |
| `Ctrl+Shift+R` | Recharger la config |

### SSH : la config suit sur les serveurs

Dans kitty, `ssh` est un alias de `kitten ssh`, qui envoie à chaque connexion :

- **sur tous les hôtes** : le terminfo de kitty (plus d'erreur `unknown terminal`) et l'intégration shell ;
- **sur le homelab** (`192.168.*`, voir `~/.config/kitty/ssh.conf`) : un prompt coloré (hôte en orange), les alias git/docker, `EDITOR` (hx, sinon nvim, sinon vi) et la config Helix. Ça marche avec **bash et zsh**.

Rien n’est écrasé sur le serveur : les fichiers vont dans `~/.config/kitty-remote/`, sauf `~/.bash_login` (qui charge d’abord le `~/.profile` du serveur, pour que ça marche aussi en root) et `~/.bash_aliases`. Le `~/.zshrc` du serveur reste chargé. Aucune installation n'est nécessaire côté serveur, sauf pour utiliser Helix.

#### Hôtes privés (hors GitHub)

Les noms et IP des machines ne sont pas dans le dépôt. Deux fichiers locaux, non versionnés, à créer sur chaque PC :

- `~/.ssh/config.d/homelab` : les blocs `Host` (le `~/.ssh/config` versionné fait `Include config.d/*`) ;
  ```
  Host nas
      HostName 192.168.1.20
      User root
  ```
- `~/.config/kitty/ssh-hosts.conf` : les mêmes noms, pour que kitten ssh y envoie la config (ignoré s'il n'existe pas) ;
  ```
  hostname nas proxmox1 docker
  include ssh-homelab.conf
  ```

### Éditeur

**Helix** (`hx`, éditeur par défaut) : LSP et Tree-sitter intégrés, aucune extension à gérer. Vérifier les langages avec `hx --health`, apprendre avec `hx --tutor`.

## Scripts d'installation

Lancés automatiquement par `chezmoi apply` (dans `.chezmoiscripts/`), seulement quand leur contenu change.

| Script | Fedora | Arch | Debian/Ubuntu |
|---|---|---|---|
| `000` paquets de base (git, fzf, fd, ripgrep, bat, btop, zoxide, zsh…) | ✅ dnf | ✅ pacman | ✅ apt |
| `000` bureau : Sway + Thunar et archives (Fedora), niri + waybar/fuzzel/mako (Arch), gimp | sauf headless | sauf headless | sauf headless |
| `002` kitty + helix (+ LSP sur machine perso) | ✅ | ✅ | helix seul |
| `003` starship | ✅ | ✅ | |
| `004` yazi | ✅ | ✅ | |
| `005` nb | perso | perso | perso |
| `006` yay (AUR) | | ✅ | |
| `007` curseurs Bibata | sauf headless | sauf headless | |
| `008` navigateur Helium | sauf headless | | |
| après : zsh comme shell par défaut | sauf ephemeral | sauf ephemeral | sauf ephemeral |
| `009` cliphist (dépôts Fedora, sinon COPR) | sauf headless | | |
| après : applis KDE du démarrage (Xwayland Video Bridge) réservées à Plasma | sauf headless | | |
| après : polices JetBrains Mono (Nerd Font) | perso, sauf headless | perso, sauf headless | |

Sur les machines **headless**, ni kitty ni le bureau ne sont installés, et les configs de bureau (niri, sway, waybar, fuzzel, mako…) ne sont pas déposées.

## Profils de machine

Définis dans `.chezmoi.toml.tmpl`, utilisables dans les templates (`{{ .personal }}`…) :

| Variable | Signification | Détermination |
|---|---|---|
| `personal` | Machine perso (polices, nb, LSP…) | hostname reconnu |
| `work` | Machine de travail | hostname reconnu |
| `headless` | Pas d'écran (pas de kitty, xclip…) | question au premier lancement |
| `ephemeral` | VM / conteneur (pas de `chsh`) | question, ou auto (Codespaces, conteneurs, utilisateurs `root`/`debian`/`ubuntu`/`vagrant`) |
| `osid` | `linux-fedora`, `linux-arch`, `linux-debian`… | automatique |

## Étapes manuelles

### Fedora

- Proton Pass CLI (alias `spc` / `spcl` pour l'agent SSH) :
  ```sh
  curl -fsSL https://proton.me/download/pass-cli/install.sh | bash
  ```
- [Proton Drive CLI](https://proton.me/support/drive-cli)

### Fedora : bureau Sway

Le script `000` installe Sway avec la config du spin Fedora (`@swaywm` + `sway-config-fedora`). Le dépôt ne contient que les **changements** par rapport à cette config, dans `~/.config/sway/config.d/` :

| Fichier | Contenu |
|---|---|
| `10-input.conf` | Clavier us/us-intl (`Super+Espace` pour changer), Caps Lock = Ctrl, touchpad |
| `20-outputs.conf` | Écrans, mêmes positions que niri |
| `30-look.conf` | Couleurs Tokyo Night, bordures, espaces entre fenêtres |
| `50-rules-perso.conf` | Firefox sur l'espace 1, kitty sur l'espace 2 |
| `60-bindings-perso.conf` | Raccourcis repris de niri (ci-dessous) |
| `60-bindings-screenshot.conf` | Captures d'écran (remplace celui de Fedora) |
| `90-bar.conf` | Remplace la barre Fedora par waybar (`~/.config/waybar/sway.jsonc`) |
| `95-autostart-perso.conf` | udiskie (montage automatique des clés USB), cliphist (historique du presse-papiers) |

Un fichier qui porte le même nom qu'un fichier de `/usr/share/sway/config.d/` le remplace. **Ne pas créer `~/.config/sway/config`** : il désactiverait toute la config Fedora.

| Raccourci | Action |
|---|---|
| `Super+Entrée` | kitty |
| `Super+D` | fuzzel (applis) |
| `Super+B` | Firefox |
| `Super+E` | Thunar (fichiers) |
| `Super+V` / `Super+Shift+V` | Historique du presse-papiers : recopier / effacer une entrée (`presse-papiers vider` pour tout effacer) |
| `Impr` / `Shift+Impr` / `Super+Impr` | Capture d'une zone / de l'écran / de la fenêtre (`~/Images/Captures` + presse-papiers) |
| `Super+Q` | Fermer la fenêtre |
| `Super+Tab` | Revenir à l'espace précédent |
| `Super+Shift+E` | Menu verrouiller / déconnexion / veille / redémarrer / éteindre (aussi le bouton ⏻ de la barre) |
| `Super+Alt+L` | Verrouiller |
| `Super+H/J/K/L`, `Super+Shift+H/J/K/L` | Focus / déplacer (raccourcis Sway par défaut) |
| `Super+Ctrl+←/→` | Passer sur l'écran de gauche / droite |
| `Super+Ctrl+Shift+←/→` | Envoyer la fenêtre sur l'écran de gauche / droite |
| `Super+Alt+Shift+←/→` | Envoyer l'espace de travail sur l'écran de gauche / droite |

Pour vérifier : `sway -C 2>&1 | grep -i error` (le code retour ne suffit pas). `swaymsg reload` recharge Sway, `pkill -SIGUSR2 waybar` recharge la barre. Les lignes `exec` (waybar, swayidle) ne sont relancées qu'à la reconnexion.

### Arch : bureau niri + noctalia

```sh
sudo pacman -S niri
yay -S noctalia-git          # yay s'installe via le script 006, sans sudo
```

Réglages du compositeur pour noctalia : [doc niri](https://docs.noctalia.dev/v5/getting-started/compositor-settings/niri/).

#### Pywalfox (couleurs de Firefox synchronisées avec noctalia)

```sh
pipx install pywalfox
```

1. Installer l'[extension Firefox Pywalfox](https://addons.mozilla.org/fr/firefox/addon/pywalfox/).
2. Dans noctalia : **Settings → Color Scheme → Templates → Programs**, activer **Firefox (Pywalfox)**.
