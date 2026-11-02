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
| [neovim](https://neovim.io/) ([LazyVim](https://www.lazyvim.org/)) | Éditeur | `~/.config/nvim/` |
| [yazi](https://yazi-rs.github.io/) | Gestionnaire de fichiers en terminal | `~/.config/yazi/` |
| [btop](https://github.com/aristocratos/btop), [fastfetch](https://github.com/fastfetch-cli/fastfetch) | Monitoring, infos système | `~/.config/btop/`, `~/.config/fastfetch/` |
| [nb](https://github.com/xwmx/nb) | Notes et favoris en ligne de commande | `~/.nbrc` |
| [niri](https://github.com/YaLTeR/niri) | Gestionnaire de fenêtres Wayland (défilement) | `~/.config/niri/` |
| [noctalia](https://docs.noctalia.dev/) | Barre, notifications, fonds d'écran (lancé par niri) | — |
| fuzzel, rofi | Lanceurs d'applications | `~/.config/fuzzel/`, `~/.config/rofi/` |
| waybar, mako | Barre et notifications (alternative à noctalia) | `~/.config/waybar/`, `~/.config/mako/` |
| alacritty, ghostty | Anciens terminaux, configs gardées | `~/.config/alacritty/`, `~/.config/ghostty/` |

Fonds d'écran Tokyo Night dans [`assets/`](assets/).

### Shell (zsh)

`~/.bashrc` bascule automatiquement sur zsh s'il est installé.

- Plugins (téléchargés par chezmoi, voir `.chezmoiexternal.toml`) : autosuggestions, syntax-highlighting, history-substring-search, completions.
- Outils : zoxide, fzf + fd (aperçu avec bat), eza à la place de `ls`, bat à la place de `cat`.
- Alias principaux :

| Alias | Commande |
|---|---|
| `h` / `v` | helix / nvim |
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

Rien n'est écrasé sur le serveur : les fichiers vont dans `~/.config/kitty-remote/`, sauf `~/.bash_aliases`, et le `~/.zshrc` du serveur reste chargé. Aucune installation n'est nécessaire côté serveur, sauf pour utiliser Helix ou nvim.

Pour ajouter des hôtes, ajouter un bloc `hostname` dans `dot_config/kitty/ssh.conf`.

### Éditeurs

- **Helix** (`hx`, éditeur par défaut) : LSP et Tree-sitter intégrés, aucune extension à gérer. Vérifier les langages avec `hx --health`, apprendre avec `hx --tutor`.
- **Neovim** (LazyVim) : extras docker, git, json, markdown, python, toml, chezmoi, harpoon, telescope.

## Scripts d'installation

Lancés automatiquement par `chezmoi apply` (dans `.chezmoiscripts/`), seulement quand leur contenu change.

| Script | Fedora | Arch | Debian/Ubuntu |
|---|---|---|---|
| `000` paquets de base (git, fzf, ripgrep, bat, btop, zsh…) | ✅ dnf | ✅ pacman | ✅ apt |
| `001` neovim (dernière version) | | | ✅ |
| `002` kitty + helix (+ LSP sur machine perso) | ✅ | ✅ | helix seul |
| `003` starship | ✅ | ✅ | |
| `004` yazi | ✅ | ✅ | |
| `005` nb | perso | perso | perso |
| `006` yay (AUR) | | ✅ | |
| `007` curseurs Bibata | ✅ | ✅ | |
| `008` navigateur Helium | ✅ | | |
| après : zsh comme shell par défaut | sauf ephemeral | sauf ephemeral | sauf ephemeral |
| après : polices JetBrains Mono (Nerd Font) | perso | perso | |

kitty n'est pas installé sur les machines **headless**.

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
