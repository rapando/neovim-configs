require("noice").setup({
    cmdline = {
        enabled = true,
        view = "cmdline_popup", -- Floating view for the command-line
    },
    popupmenu = {
        enabled = true,
        backend = "nui",
    },
    messages = {
        enabled = true,
        view = "mini",     -- Optional: floating mini messages
    },
    lsp = {
        progress = {enabled = true},
        hover = {enabled = true},
        signature = {enabled = true},
    },
    notify = {
        enabled = true,
        view = "notify",
    },
    presets = {
        bottom_search = true,      -- Bottom search
        command_palette = true,    -- Command palette view
    },
})

-- menu options
vim.keymap.set("n", "<C-t>", function()
	require("menu").open("default")
end, {})

vim.keymap.set("n", "<RightMouse>", function()
	vim.cmd.exec '"normal! \\<RightMouse>"'
	local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
	require("menu").open(options, { mouse = true, border = false })
end, {})

