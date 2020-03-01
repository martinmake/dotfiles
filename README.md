# martinmake's Arch Linux dotfiles

## Description

These are all my Arch Linux user dotfiles managed through git

## Installation

1. Clone the repository

```sh
git clone https://www.github.com/martinmake/dotfiles-archlinux ~/.config/dotfiles
```

2. To address the repository you should setup this alias

```sh
alias dotfiles="git --git-dir=~/.config/dotfiles/ --work-tree=/$HOME/"
```

## Usage

* Adding dotfiles

```sh
dotfiles add <DOTFILE>...
dotfiles commit
dotfiles push
```

################################################################
## HOW SYMLINK CONFIGURATION AND INSTALL ALL PACKAGES

```console
$ ./stow_all.sh
$ ./install_packages.sh
```

## HOW SAVE CONFIGURATION

```console
$ ./save_packages.sh
```
