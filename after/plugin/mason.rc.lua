local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({})

lspconfig.setup {
    ensure_installed = {
        "bashls",
        "pyright",
        "sumneko_lua",
        "html",
        "tsserver",
        "jsonls",
        "vuels",
        "gopls",
        "golangci_lint_ls",
        "emmet_ls",
        "kotlin_language_server",
        "powershell_es",
    },
  automatic_installation = false
}
