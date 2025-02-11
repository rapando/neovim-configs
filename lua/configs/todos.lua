vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, {desc = "Next TODO comment" })


vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, {desc = "Preview TODO comment" })

vim.keymap.set("n", "<leader>tf", "TodoTelescope<CR>", { desc = "Find ToDos" })

