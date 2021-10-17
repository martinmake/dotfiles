# martinmake's dotfiles

## Description

All of martinmake's configs, scripts, installed programs

![pacgraph](https://raw.github.com/martinmake/dotfiles/master/pacgraph.svg)

## Installation

1. Clone the repository

```sh
git clone https://www.github.com/martinmake/dotfiles ~/dotfiles
```

2. To address the repository you should add this alias

```sh
alias dotfiles="git --git-dir=$HOME/dotfiles/ --work-tree=/$HOME/"
```

## Usage

* Linking and installing is done through make, for more info run `make help`

* Adding dotfiles

```sh
dotfiles add <DOTFILE>...
dotfiles commit
dotfiles push
```
