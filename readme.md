## Neovim Configs

### Installation

> Because of a few issues with rust setup, I have followed [this](https://github.com/letsgetrusty/neovim-rust) configs from this [YouTube video](https://www.youtube.com/watch?v=E2mKJ73M9pg&t=1s) as a proof of concept


First of all, install the prerequisites

```sh
brew install neovim fd ripgrep fzf rust-analyzer lazygit cmake node@22
npm install -g typescript-language-server pyright luajit gcc


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

For neorg

```sh
luarocks install neorg --local
echo 'export LUA_PATH="$HOME/.luarocks/share/lua/5.1/?.lua;$LUA_PATH"' >> ~/.zshrc
echo 'export LUA_CPATH="$HOME/.luarocks/lib/lua/5.1/?.so;$LUA_CPATH"' >> ~/.zshrc
source ~/.zshrc
```



Clean up

```sh
sudo rm -r lua-5.1.5 luarocks-3.9.1

```

Install tools

```sh
rustup component add clippy-preview rust-src rustfmt
```

Download a nerd font from this [website](https://www.nerdfonts.com/font-downloads) and set it as your terminal font.

Install these configs

```sh
git clone https://github.com/rapando/neovim-configs ~/.config/nvim && nvim
```
