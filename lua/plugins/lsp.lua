return {
    {
        "jiangmiao/auto-pairs",
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright" },
            })
            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup {}
            lspconfig.pyright.setup {}
        end,
        opts = function()
            setup = {
                rust_analyzer = function()
                    return true
                end
            }
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
            "onsails/lspkind-nvim",     -- Adds VSCode-like icons to autocompletion
            "L3MON4D3/LuaSnip",         -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                    }),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
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
    {
        'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
    },
    { 'simrat39/rust-tools.nvim' },
    { 'nvim-lua/plenary.nvim' },
    {
        'terrortylor/nvim-comment',
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
    -- Javascript
    {
        'neoclide/coc.nvim', build = 'npm install --frozen-lockfile',
    },
    {
        'yuezk/vim-js',
    },
    {
        'HerringtonDarkholme/yats.vim',
    },
    {
        'maxmellon/vim-jsx-pretty',
    },
    -- note taking
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },
    {
        "nvim-neorg/lua-utils.nvim",
    },
    {
        "nvim-neotest/nvim-nio",
    },
    {
        "pysan3/pathlib.nvim",
    },

    {
        "nvim-neorg/neorg",
        -- build = ":Neorg sync-parsers",
        dependencies = { "luarocks.nvim" },
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {}, -- Load default functionality
                    -- ["core.norg.dirman"] = { -- Directory manager
                    --     config = {
                    --         workspaces = {
                    --             my_workspace = "~/Documents"
                    --         }
                    --     }
                    -- },
                    -- ["core.norg.concealer"] = {},
                    -- ["core.norg.completion"] = {},
                },
            })
        end,
    },
}
