# A Vim Configuration

## Introduction

This repository contains my own vim configuration. It is tuned for a
[bépo](http://bepo.fr/wiki/Accueil) keyboard layout, user experience might
not be the same with another layout.

This configuration in a few bullet points:

* Uses [Vundle](https://github.com/VundleVim/Vundle.vim) for plugins management
* Integrates a set of useful plugins:

    * python using [python-mode](https://github.com/klen/python-mode)
    * git using [fugitive](https://github.com/tpope/vim-fugitive)
    * fuzzy file navigation with [CTRL-P](https://github.com/kien/ctrlp)
    * and also support for Latex, Haskell, Markdown and some other plugins
    (see `vimrc.bundles`).

## Install on Linux

```bash
    $ git clone https://github.com/thomashk0/vimrc.git
    $ cd vimrc && ./install.sh
    $ vim
```

The first run will install packages, leave an run vim again to have a fully
working environment.

## Install on Windows

* Install Git for windows, clone this repository, let call %VIMRC_DIR% its absolute path.
* Manually install Vundle
* Edit vimrc in the repository and put the absolute path where you install vundle in the following line
```vim
   set rtp+=~/.vim/bundle/vundle/
```
* Replace the path with %VIMRC_DIR%/vimrc.bundles (note that there is not the first dot in 'vimrc.bundle') in this line in the vimrc
```vim
   source ~/.vimrc.bundles
```
* copy vimrc in the repository in your user directory as _vimrc
* Launch vim (you should have lots of errors on start) and run :BundleInstall
* You can restart vim and it will be fine

Some plugins like TagBar require tools such as ctags that you must install to
use the plugins, and place them in your path. But vim will not print any error
message if you do not try to use them.

## Key Bindings

The key bindings rely heavily on the \<leader\> key, currently defined as
space (inspired by Spacemacs).
Most key bindings are optimized for a bépo keyboard layout,
they might seems strange or horrible on an AZERTY or QWERTY keyboard.

### File Manipulation

| Key         | Description                               |
|-------------|-------------------------------------------|
| \<leader\>s | Try to save current file                  |
| \<leader\>q | Close current file, does not save changes |

### Tabs switching

| Key          | Desc                  |
|--------------|-----------------------|
| \<leader\>tc | Close the current tab |
| \<leader\>tp | Go to previous tab    |
| \<leader\>tl | Go to next tab        |


### File Opening/Switching, Fuzzy Finding

They are prefixed with \<leader\>r.

| Key          | Description                        |
|--------------|------------------------------------|
| \<leader\>rr | Open CTRL-P (Search on filesystem) |
| \<leader\>ra | Open CTRL-P on buffers             |
| \<leader\>ru | Open CTRL-P on recent files        |
| \<leader\>ri | Open CTRL-P on tags                |

### Completion Bindings

These bindings are for Insert mode

| Key | Description                     |
|-----|---------------------------------|
| ,o  | Omnicompletion (\<C-X\>\<C-O\>) |
| ,l  | Complete line (\<C-X\>\<C-L\>)  |
| ,t  | Complete Tag (\<C-X\>\<C-]\>)   |
| ,f  | Complete File (\<C-X\>\<C-F\>)   |


### Git Related

Prefixed with \<leader\>g

| Key          | Description        |
|--------------|--------------------|
| \<leader\>gs | Git status         |
| \<leader\>gd | Git diff with HEAD |
