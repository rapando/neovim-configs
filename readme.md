## Neovim Configs

### Introduction

This is just a personal neovim configs for mainly Rust, Go and JS. C & Python might not be fully
supported and in case you find any bugs please raise and issue/ PR to contribute.

This assumes you have Go & Rust installed.

### Installation

First of all, install the prerequisites.
\<mark\>These instructions assume the usage of brew on Mac. If you have any other OS, please follow
the installation instructions of each prerequisite\</mark\>

```sh
brew install neovim fd ripgrep fzf rust-analyzer lazygit cmake node@22
npm install -g typescript-language-server pyright luajit gcc
rustup component add clippy-preview rust-src rustfmt


# because neovim requires lua version 5.1 for some reason, install it manually
curl -LO https://www.lua.org/ftp/lua-5.1.5.tar.gz
tar -xvf lua-5.1.5.tar.gz
cd lua-5.1.5
make macosx
sudo make install
lua -v
cd ..


# install luarocks
curl -LO https://github.com/luarocks/luarocks/archive/refs/tags/v3.9.1.tar.gz
tar -xvzf v3.9.1.tar.gz
cd luarocks-3.9.1
./configure --with-lua=/usr/local --lua-version=5.1 --prefix=/usr/local
make
sudo make install
cd ..
```

---
### Latex
In case you are using Latex,

```sh 
brew install mactex zathura
```

When you write *.tex files, it will auto-compile on save. You can open the pdf file in your favorite
viewer.
---

Download a nerd font from this [website](https://www.nerdfonts.com/font-downloads) and set it as your terminal font.

Install these configs

```sh
git clone https://github.com/rapando/neovim-configs ~/.config/nvim && nvim
```
---

### Key Maps

The leader key is mapped to 'spacebar'. You can get all the keybindings from lua/configs but these
are the ones I mostly use.

| Binding | Language/ Tech | Explanation | 
| :--- | :--- | :---|
| \<leader\>gg | General | Opens Lazygit interface |
| \<C-n\> | General | Open or close the file tree |
| \<C-t\> or Right click| General | Open menu options |
| \<leader\>v | General | Split vertically |
| \<leader\>tt | General | Open terminal at the bottom |
| \<leader\>f | General | Global search for a symbol |
| \<leader\>o | General | Search for and open a file |
| \<leader\>gc | General | Show Git status in floating window |
| \<leader\>m | General | Multi-cursor select. \<C-n\> [more](https://github.com/mg979/vim-visual-multi?tab=readme-ov-file#vim-visual-multi) |
| \<leader\>S | General | Open search interface |
| \<leader\>sw | General | Search current word |
| \<leader\>sp | General | Search current file |
| gD | Golang | Go to symbol declaration |
| gd | Golang/ Rust | Go to symbol definition |
| K | Golang/ Rust | Hover over a symbol to see a summary |
| \<leader\>c | Rust | Code actions e.g optimizing import structure |
|\<leader\>rr| Rust | Runnables, e.g cargo check |
| \<leader\>rf | Rust | Format code |
| \<leader\>ru | Rust | Organize imports |

#### More commands

| Command | Explanation | 
| ---: | :--- |
| Leet | Open Leetcode |

For leetcode, sign in with cookie. Sign in to Leetcode, then copy the cookie from the browser's
Application tab. Under the cookies, use leetcode.com and copy the value for LEETCODE_SESSION

#### Usage

You can open a folder using 

```sh
nvim ~/path/to/project
```

If you open nvim without specifying the folder, you will see a dashboard page, from here, you can
open your folder using this command

```vim
:cd ~/path/to/project
```

This is important especially when using a nvim client such as [neovide](https://github.com/neovide/neovide).

\> rapando
