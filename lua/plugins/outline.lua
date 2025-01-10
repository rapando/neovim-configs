return {
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup({
                    width = 15,
                })

            -- keybinding to toggle the outline 
            vim.keymap.set("n", "<leader>k", ":SymbolsOutline<CR>", { desc = "Toggle Symbols Outline" })
        end,
    }
}
