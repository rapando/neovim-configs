-- disable the default tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- nvim-tree settings
require("nvim-tree").setup({
    view = {
        width = 30,
        side = "left",
    },
    filters = {
        dotfiles = false,  -- Show hidden files
    },
    git = {
        ignore = false,
    },
    renderer = {
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
            },
        },
    },
})

-- <C-n> opens/closes nvim-tree
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Mapping to open file in a vertical split to the right
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit <C-R>=expand("%:p:h")<CR>/<C-R>=expand("%:t")<CR><CR>', { noremap = true, silent = true })


-- Mapping to open file in a vertical split to the left
vim.api.nvim_set_keymap('n', '<leader>V', ':leftabove Vsplit<CR>', { noremap = true, silent = true })

