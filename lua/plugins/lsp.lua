return {
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make"
		}
	},
	{
		"yamatsum/nvim-cursorline",
	},
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
			lspconfig.intelephense.setup({
				cmd = { "intelephense", "--stdio" },
				filetypes = { "php" },
				root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
			})
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
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
            highlight = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
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
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },

	-- PHP
	{
		'sheerun/vim-polyglot',
		lazy = false,
	},
	{
		'phpactor/phpactor',
		build = function()
			vim.fn.system({"composer", "install", "--no-dev", "--optimize-autoloader"})
		end,
		config = function()
			vim.g.phpactorMappingEnabled = false
		end,
	},

	-- debugging
	{
		"mfussenegger/nvim-dap",
		dependencies = {
		  "rcarriga/nvim-dap-ui",
          "nvim-neotest/nvim-nio",
		},
		config = function()
		  local dap = require("dap")
		  local dapui = require("dapui")

		  dapui.setup()
		  dap.adapters.php = {
			type = "executable",
			command = "node",
			args = { "vscode-php-debug/out/phpDebug.js" },
		  }
		  dap.configurations.php = {
			{
			  type = "php",
			  request = "launch",
			  name = "Listen for Xdebug",
			  port = 9003,
			},
		  }

		  -- Keybindings for debugging
		  vim.keymap.set("n", "<F5>", function() dap.continue() end)
		  vim.keymap.set("n", "<F10>", function() dap.step_over() end)
		  vim.keymap.set("n", "<F11>", function() dap.step_into() end)
		  vim.keymap.set("n", "<F12>", function() dap.step_out() end)
		end,
	  },



}
