-- empty setup using defaults
require("nvim-tree").setup()

vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<Return>')
vim.keymap.set('n', '<C-f>', ':NvimTreeFindFile<Return>')
-- a => create file
-- d => delete file
-- r => rename file
-- x => cut
-- c => copy
-- p => paste
-- W => collapse all
-- E => expand all
