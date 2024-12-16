-- set dark background
vim.o.background = "dark"

-- set colorscheme
require("bluloco").setup({
	style = "dark",
	transparent = true,
	italics = true,
	terminal = vim.fn.has("gui_running") ==  1,
	guicursor = true,
})
vim.cmd("colorscheme bluloco")
vim.opt.background = "dark"

-- enable the tabline
vim.g['airline#extensions#tabline#enabled'] = 1

vim.g['airline#extensions#tabline#left_sep'] = ' '
vim.g['airline#extensions#tabline#left_alt_sep'] = '|'

