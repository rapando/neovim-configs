return {
    {
        "MunifTanjim/nui.nvim",
    },
    {
        "rcarriga/nvim-notify",
    },
    {
        "folke/noice.nvim",
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)"
            },
        },
    }
}
