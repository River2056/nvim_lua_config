require("lspconfig").tsserver.setup({
    root_dir = function()
        return vim.loop.cwd()
    end,
})
vim.cmd([[au! BufWritePost *.js :lua vim.lsp.buf.formatting_seq_sync()]])
