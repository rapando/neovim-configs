-- set dark background
vim.o.background = "dark"

-- set colorscheme
vim.cmd("colorscheme citruszest")

-- enable the tabline
vim.g['airline#extensions#tabline#enabled'] = 1

vim.g['airline#extensions#tabline#left_sep'] = ' '
vim.g['airline#extensions#tabline#left_alt_sep'] = '|'

-- dashboard
require("dashboard").setup {
    theme = 'hyper',
}

-- user paper theme for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.cmd("colorscheme PaperColorSlim")
    vim.o.background = "light"
  end,
})
