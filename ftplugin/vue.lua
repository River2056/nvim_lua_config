require("lspconfig").tsserver.setup({})
vim.cmd([[au! BufWritePost *.vue :lua vim.lsp.buf.formatting_seq_sync()]])
vim.cmd([[au! BufWritePost *.js :lua vim.lsp.buf.formatting_seq_sync()]])
