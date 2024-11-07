## Neovim Configs

### Installation



First of all, install the prerequisites

```sh
brew install lua luarocks neovim fd ripgrep fzf rust-analyzer lazygit
```

Install tools

```sh
rustup component add clippy-preview rust-src rustfmt
```

Install these configs

```sh
git clone https://github.com/rapando/neovim-configs ~/.config/nvim && nvim
```