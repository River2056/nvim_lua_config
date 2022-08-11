vim.cmd([[au! BufWritePost *.py :lua vim.lsp.buf.formatting_seq_sync()]])
