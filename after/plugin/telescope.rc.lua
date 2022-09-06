require("telescope").setup({
    defaults = {
        borderchars = {
            prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
            results = { " " },
            preview = { " " },
        },
    },
})
vim.keymap.set("n", "<Leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>')
vim.keymap.set("n", "<Leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
vim.keymap.set("n", "<Leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>')
vim.keymap.set("n", "<Leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
