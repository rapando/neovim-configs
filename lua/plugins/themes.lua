return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
    { "glepnir/dashboard-nvim" },  -- startup dashboard
    { "vim-airline/vim-airline" }, -- status line at the bottom
    { "vim-airline/vim-airline-themes" },
    {
        "zootedb0t/citruszest.nvim",
        lazy = false,
        priority = 1000,
    },
    { 'pappasam/papercolor-theme-slim' },
    { 'nyoom-engineering/oxocarbon.nvim' },
  }
