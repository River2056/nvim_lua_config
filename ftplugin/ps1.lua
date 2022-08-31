local config = require("kevin.constants")

require"lspconfig".powershell_es.setup({
    bundle_path = config.powershell_es_path
})
