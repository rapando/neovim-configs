-- Livegrep feature for searching for files.
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope live_grep<CR>', { noremap = true, silent = true })
