## Neovim Configs

### Installation



First of all, install the prerequisites

```sh
# because neovim requires lua version 5.1 for some reason, install it manually
curl -LO https://www.lua.org/ftp/lua-5.1.5.tar.gz
tar -xvf lua-5.1.5.tar.gz
cd lua-5.1.5
make macosx
sudo make install
lua -v

brew install luarocks neovim fd ripgrep fzf rust-analyzer lazygit
```

Install tools

```sh
rustup component add clippy-preview rust-src rustfmt
```

Install these configs

```sh
git clone https://github.com/rapando/neovim-configs ~/.config/nvim && nvim
```
