return {
    {
        "MunifTanjim/nui.nvim",
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
    },
	{
		"TobinPalmer/Tip.nvim",
		event = "VimEnter",
		init= function()
			-- Default config
			--- @type Tip.config
			require("tip").setup({
				seconds = 2,
				title = "Tip",
				url = "https://vtip.43z.one",
			})
		end,
	},
	{
		"nvzone/volt", 
	},
	{
		"nvzone/menu",
	}
}
