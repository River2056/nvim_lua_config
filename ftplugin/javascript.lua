--[[ require("lspconfig").tsserver.setup({
    root_dir = function()
        return vim.loop.cwd()
    end,
}) ]]
require("lspconfig").tsserver.setup({})
vim.cmd([[au! BufWritePost *.js :lua vim.lsp.buf.format()]])
