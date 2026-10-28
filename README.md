# dotfiles-nix

[![ci](https://github.com/Urthella/dotfiles-nix/actions/workflows/ci.yml/badge.svg)](https://github.com/Urthella/dotfiles-nix/actions/workflows/ci.yml)

My shell and dev environment as a [home-manager](https://github.com/nix-community/home-manager) flake, tuned for NixOS-WSL but fine on any Linux. One command rebuilds the whole setup on a fresh machine.

## What's inside

| | |
|---|---|
| Shell | zsh with autosuggestions and syntax highlighting, starship prompt, zoxide, fzf, tmux |
| Editor | Helix (tokyonight) as `$EDITOR` |
| Git | `main` as default branch, rebase on pull, rerere, gh, lazygit |
| Dev shells | direnv + nix-direnv, pairs with [nix-devshells](https://github.com/Urthella/nix-devshells) |
| CLI | ripgrep, fd, bat, eza, jq, yq, just, htop |
| Nix | nil (LSP), nixfmt |
| WSL | `wslview` as `$BROWSER`, so links open in Windows |

## Install

Requires Nix with flakes enabled.

```bash
git clone https://github.com/Urthella/dotfiles-nix ~/dotfiles-nix
nix run home-manager/master -- switch --flake ~/dotfiles-nix#utku
```

After that, `hms` re-applies changes. On a different username, edit `home.username` and `home.homeDirectory` in [home.nix](home.nix).

## CI

Every push and PR builds the complete home-manager generation, so a broken option or a removed package fails before it reaches `main`.

## License

[MIT](LICENSE)
