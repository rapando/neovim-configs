return {
	{ "vim-airline/vim-airline" }, -- status line at the bottom
    { "vim-airline/vim-airline-themes" },
	-- themes
	{ 
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"comfysage/evergarden",
		priority = 1000,
		opts = {
			transparent_background = true,
			contrast_dark = "hard",
		}
	}
}
