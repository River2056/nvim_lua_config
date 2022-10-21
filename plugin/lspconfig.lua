local c = require("kevin.constants")
local lsp = require("kevin.lsp")
local nvim_lsp = require("lspconfig")
local util = require("lspconfig.util")
local protocol = require("vim.lsp.protocol")

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})

-- common lsp configs
for _, server in ipairs(lsp.servers) do
	nvim_lsp[server].setup({
		on_attach = lsp.on_attach,
		capabilities = lsp.capabilities,
	})
end

-- specific additional configs per language
nvim_lsp.sumneko_lua.setup({
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

nvim_lsp.tsserver.setup({
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	cmd = { "typescript-language-server.cmd", "--stdio" },
	root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git") or vim.loop.cwd(),
})

nvim_lsp.ccls.setup({
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
})

nvim_lsp.cmake.setup({
	on_attach = lsp.on_attach,
	capabilities = lsp.capabilities,
})

nvim_lsp.powershell_es.setup({
    bundle_path = c.powershell_es_path
})
