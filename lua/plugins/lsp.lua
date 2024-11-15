return {
    {
        "jiangmiao/auto-pairs",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup{}
            lspconfig.pyright.setup{}
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",       -- LSP source for nvim-cmp
            "onsails/lspkind-nvim",       -- Adds VSCode-like icons to autocompletion
            "L3MON4D3/LuaSnip",           -- Snippet engine
            "saadparwaiz1/cmp_luasnip",   -- Snippet source for nvim-cmp
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                    }),
                },
            })
        end,
    },
    {
        "williamboman/nvim-lsp-installer",
        config = function()
            require("nvim-lsp-installer").setup {}
        end,
    },
    {
        "mfussenegger/nvim-lint",
    },
    -- Go
    {
        "fatih/vim-go",
        build = ":GoUpdateBinaries",
        ft = { "go" }
    },
    -- Rust
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "simrat39/rust-tools.nvim" },
    { "rust-lang/rust.vim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "nvim-lua/plenary.nvim" },
    -- Latex
    {
        "lervag/vimtex"
    },
    {
        'terrortylor/nvim-comment',
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = {'nvim-treesitter/nvim-treesitter'},
    }

}
