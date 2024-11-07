## Neovim Configs

### Installation



First of all, install the prerequisites

```sh
brew install neovim fd ripgrep fzf rust-analyzer lazygit

# because neovim requires lua version 5.1 for some reason, install it manually
curl -LO https://www.lua.org/ftp/lua-5.1.5.tar.gz
tar -xvf lua-5.1.5.tar.gz
cd lua-5.1.5
make macosx
sudo make install
lua -v

# install luarocks
curl -LO https://github.com/luarocks/luarocks/archive/refs/tags/v3.9.1.tar.gz
tar -xvzf v3.9.1.tar.gz
cd luarocks-3.9.1
./configure --with-lua=/usr/local --lua-version=5.1 --prefix=/usr/local
make
sudo make install


```

Install tools

```sh
rustup component add clippy-preview rust-src rustfmt
```

Install these configs

```sh
git clone https://github.com/rapando/neovim-configs ~/.config/nvim && nvim
```
