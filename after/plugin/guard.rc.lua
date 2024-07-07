local ft = require("guard.filetype")

ft("python"):fmt("black")
ft("lua"):fmt("lsp"):append("stylua")
-- ft('typescript,javascript,typescriptreact'):fmt('prettier')
ft('typescript,javascript,typescriptreact'):fmt('eslint_d')
-- ft('html'):fmt('html-lsp')
-- ft('html'):fmt("lsp"):append("prettier")
ft("cs"):fmt("lsp"):append("csharpier")
ft("c"):fmt("lsp"):append("clang-format")
ft("go"):fmt("gofumpt")

require("guard").setup({
    -- the only options for the setup function
    fmt_on_save = true,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = true,
})
