-- Livegrep feature for searching for files.
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- search and replace
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")

local function search_and_replace()
    builtin.live_grep({
        attach_mappings = function(_, map)
            map("i", "<C-e>", function(prompt_bufnr)
                local entry = action_state.get_selected_entry()
                local query = entry.text
                actions.close(prompt_bufnr)

                -- Ask for replacement text
                local replacement = vim.fn.input("Replace with: ", "")
                if replacement == "" then
                    print("No replacement made.")
                    return
                end

                -- Perform search and replace in the current buffer
                vim.api.nvim_command("%s/" .. vim.fn.escape(query, "/") .. "/" .. vim.fn.escape(replacement, "/") .. "/g")
                print("Replaced '" .. query .. "' with '" .. replacement .. "'.")
            end)
            return true
        end,
    })
end


vim.keymap.set(
    'n',
    '<leader>sr',
    search_and_replace,
    { noremap = true, silent = true, desc = "Search and Replace" }
)

