-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- General Vim Options
vim.opt.tabstop = 4
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.guicursor = ""
vim.opt.softtabstop = 4
vim.opt.showtabline = 4
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")
vim.opt.clipboard:append("unnamedplus")
-- Add fzf to the runtime path (rtp)
vim.opt.rtp:append('/opt/homebrew/opt/fzf')
vim.opt.incsearch = true -- shows matches when you type
-- Comment wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 100
vim.opt.formatoptions:append('cro') -- auto wrap comments
vim.opt.smartindent = true
vim.opt.termguicolors = true

-- manual formatting
vim.keymap.set('n', 'gq', 'gq', { noremap = true, silent = true })

-- Specific to neovide (clients for nvim)
vim.o.guifont = "BlexMono Nerd Font Mono:h16"

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    import = "plugins"
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Load configs
require("configs.floating")
require("configs.git")
require("configs.lsp")
require("configs.search")
require("configs.tree")
require("configs.themes")
require("configs.terminal")
