require('harpoon').setup {}

-- harpoon
vim.keymap.set('n', '<Leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<Return>')
vim.keymap.set('n', '<Leader>ha', ':lua require("harpoon.mark").add_file()')
vim.keymap.set('n', '<Leader>hn', ':lua require("harpoon.ui").nav_next()')
vim.keymap.set('n', '<Leader>hp', ':lua require("harpoon.ui").nav_prev()')
