local lspconfig = require("lspconfig")

-- JS setup
lspconfig.ts_ls.setup{}

-- Python LSP
lspconfig.pyright.setup{}

-- Go LSP
lspconfig.gopls.setup {
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Equivalent of Ctrl+Click
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)  -- Function documentation
        buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)  -- Parameter info
        buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<leader>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<leader>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<leader>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<leader>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', '<leader>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<leader>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
        buf_set_keymap('n', '<leader>so', [[<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
    end,

    flags = {
        debounce_text_changes = 150,
    }
}

vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

-- Go Linting
require('lint').linters_by_ft = {
  go = { 'golangcilint' },
}


-- Linting for different languages
local lint = require('lint')

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.go",
  callback = function()
    lint.try_lint()
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()
    lint.try_lint()
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.js",
  callback = function()
    lint.try_lint()
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.rs",
  callback = function()
    lint.try_lint()
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.c",
  callback = function()
    lint.try_lint()
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.ts",
  callback = function()
    lint.try_lint()
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.css",
  callback = function()
    lint.try_lint()
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.html",
  callback = function()
    lint.try_lint()
  end,
})


-- CMP Configs
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline('?', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['gopls'].setup {
  capabilities = capabilities
}


-- Latex
-- Set the viewer method to 'zathura' for VimTeX
vim.g.vimtex_view_method = 'zathura'

-- Set the compiler method to 'latexmk' for VimTeX
vim.g.vimtex_compiler_method = 'latexmk'

-- Uncomment and modify the following lines as necessary
-- vim.g.vimtex_view_general_viewer = 'open'
-- vim.g.vimtex_view_general_options = ''

-- Configure 'latexmk' settings for VimTeX
vim.g.vimtex_compiler_latexmk = {
    build_dir = '',
    callback = 1,
    continuous = 1,
    executable = 'latexmk',
    options = {
        '-xelatex',
        '-file-line-error',
        '-interaction=nonstopmode',
        '-synctex=1',
    },
}

-- comments settings
require('nvim_comment').setup({
    hook = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end,
})

-- RUST
local rt = require("rust-tools")

rt.setup({
    tools = {
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
        },
    },
    server = {
        on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            -- Keybindings for LSP
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, bufopts)
            vim.keymap.set("n", "<Leader>rr", rt.runnables.runnables, bufopts)

            -- Format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end,
        settings = {
            ["rust-analyzer"] = {
                cargo = { allFeatures = true },
                checkOnSave = { command = "clippy" },
            },
        },
    },
})



-- treesitter settings for rust and any other language
-- require("nvim-treesitter.configs").setup({
  -- ensure_installed = { "rust" },
  -- highlight = { enable = true },
-- })


