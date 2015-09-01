# A Vim configuration

## Introduction

This repository contains a Vim configuration. It is tuned for a
[bépo](http://bepo.fr/wiki/Accueil) keymap, user experience might not be the
same with another layout.

This configuration

  * uses [Vundle](https://github.com/VundleVim/Vundle.vim) for plugins management,
  * provides support for :
      * python using [python-mode](https://github.com/klen/python-mode)
      * git using [fugitive](https://github.com/tpope/vim-fugitive)
      * fuzzy file navigation with [CTRL-P](https://github.com/kien/ctrlp)
      * and also support for Latex, haskell, markdown and some other plugins,
      see vimrc.bundles to see the complete list
  * tries to remain as simple as possible, extra fancy plugins are progressively removed.

## Requirements

   * ~~Linux distribution~~
   * Git
   * Vim 7.3+

## Install on Linux

```bash
    $ git clone https://github.com/thomashk0/vimrc.git
    $ cd vimrc && ./install.sh
```
And go !

```bash
    $ vim
```
## Install on Windows (harder =p)

 * Install Git for windows, clone this repository, lets call %VIMRC_DIR% its absolute path.
 * Manually install vundle
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

Some plugins like TagBar requires tools such as ctags that you must install to
use the plugins, and place them in your path. But vim will not print any error
message if you do not try to use them.

## Key bindings

The key bindings rely heavily on the \<leader\> key, currently defined as
space.  Most key bindings are optimized for a bépo keyboard layout,
they might seems strange or horrible on a AZERTY or QWERTY keyboard.

### File manpulation

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


### File Opening/switching, Fuzzy finding

They are prefixed with \<leader\>r.

| Key          | Description                        |
|--------------|------------------------------------|
| \<leader\>rr | Open CTRL-P (Search on filesystem) |
| \<leader\>ra | Open CTRL-P on buffers             |
| \<leader\>ru | Open CTRL-P on recent files        |
| \<leader\>ri | Open CTRL-P on tags                |

### Completion bindings

These bindings are for Insert mode

| Key | Description                     |
|-----|---------------------------------|
| ,o  | Omnicompletion (\<C-X\>\<C-O\>) |
| ,l  | Complete line (\<C-X\>\<C-L\>)  |
| ,t  | Complete Tag (\<C-X\>\<C-]\>)   |
| ,f  | Complete File (\<C-X\>\<C-F\>)   |


### Git related

Prefixed with \<leader\>g

| Key          | Description        |
|--------------|--------------------|
| \<leader\>gs | Git status         |
| \<leader\>gd | Git diff with HEAD |
