require("lspconfig").vuels.setup({
    -- root_dir = util.root_pattern("package.json", "vue.config.js")
})
vim.cmd([[au! BufWritePost *.vue :lua vim.lsp.buf.formatting_seq_sync()]])
vim.cmd([[au! BufWritePost *.js :lua vim.lsp.buf.formatting_seq_sync()]])
