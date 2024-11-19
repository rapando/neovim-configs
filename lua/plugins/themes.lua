return {
    { "glepnir/dashboard-nvim"}, -- startup dashboard
    {"vim-airline/vim-airline"}, -- status line at the bottom
    {"vim-airline/vim-airline-themes"},
    { "ellisonleao/gruvbox.nvim" },
    { "ribru17/bamboo.nvim" },
    { 
        "oxfist/night-owl.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("night-owl").setup()
        end,
    }
}
