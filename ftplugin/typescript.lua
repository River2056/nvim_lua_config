require("lspconfig").tsserver.setup({})
vim.cmd([[au! BufWritePost *.ts :lua vim.lsp.buf.format()]])
