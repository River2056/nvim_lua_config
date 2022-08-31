local util = require("lspconfig/util")
require("lspconfig").kotlin_language_server.setup({
    -- root_dir = util.root_pattern("", "settings.gradle"),
    root_dir = function()
        return vim.loop.cwd()
    end,
})
