return {
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup({
                    width = 40,
                })

            -- keybinding to toggle the outline 
            vim.keymap.set("n", "<leader>o", ":SymbolsOutline<CR>", { desc = "Toggle Symbols Outline" })
        end,
    }
}
