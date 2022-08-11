local nvim_lsp = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")

local protocol = require("vim.lsp.protocol")

local servers = {
	"bashls",
	"pyright",
	"sumneko_lua",
	"html",
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found and not server:is_installed() then
		print("Installing " .. name)
		server:install()
	end
end

local on_attach = function(client, bufnr)
	-- Create some shortcut functions.
	-- NOTE: The `vim` variable is supplied by Neovim.
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }

	-- ======================= The Keymaps =========================
	-- jump to definition
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

	-- Format buffer
	buf_set_keymap("n", "<F3>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	-- Jump LSP diagnostics
	-- NOTE: Currently, there is a bug in lspsaga.diagnostic module. Thus we use
	--       Vim commands to move through diagnostics.
	buf_set_keymap("n", "[g", ":Lspsaga diagnostic_jump_prev<CR>", opts)
	buf_set_keymap("n", "]g", ":Lspsaga diagnostic_jump_next<CR>", opts)

	-- Rename symbol
	buf_set_keymap("n", "<leader>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)

	-- Find references
	buf_set_keymap("n", "gr", '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)

	-- Doc popup scrolling
	buf_set_keymap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
	buf_set_keymap("n", "<C-1>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
	buf_set_keymap("n", "<C-0>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

	-- codeaction
	buf_set_keymap("n", "<leader>ac", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
	buf_set_keymap("v", "<leader>a", ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)

	-- Floating terminal
	-- NOTE: Use `vim.cmd` since `buf_set_keymap` is not working with `tnoremap...`
	vim.cmd([[
        nnoremap <silent> <A-d> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
        tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>
    ]])

	-- formatting
	if client.server_capabilities.documentFormattingProvider then
		print("format " .. vim.bo.filetype)
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.formatting_seq_sync()
			end,
		})
	end
end

local server_specific_opts = {
	sumneko_lua = function(opts)
		opts.settings = {
			Lua = {
				-- NOTE: This is required for expansion of lua function signatures!
				completion = { callSnippet = "Replace" },
				diagnostics = {
					globals = { "vim" },
				},
			},
		}
	end,

	html = function(opts)
		opts.filetypes = { "html", "htmldjango" }
	end,
}

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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
	-- the keymaps, flags and capabilities that will be sent to the server as
	-- options.
	local opts = {
		on_attach = on_attach,
		flags = { debounce_text_changes = 150 },
		capabilities = capabilities,
	}

	-- If the current surver's name matches with the ones specified in the
	-- `server_specific_opts`, set the options.
	if server_specific_opts[server.name] then
		server_specific_opts[server.name](opts)
	end

	-- And set up the server with our configuration!
	server:setup(opts)
end)

--[[ nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
})

nvim_lsp.pyright.setup({
	on_attach = on_attach,
}) ]]

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
