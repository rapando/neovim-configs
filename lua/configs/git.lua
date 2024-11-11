vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CR>', ":q<CR>", {noremap = true, silent=true})

require("lazygit").setup({
  close_on_exit: true
})
