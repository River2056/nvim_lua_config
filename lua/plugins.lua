local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed")
    return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim") -- Common utilities
    use("kyazdani42/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons") -- File icons
    use("nvim-telescope/telescope.nvim")
    use("norcalli/nvim-colorizer.lua")
    use("kylechui/nvim-surround")
    use("b3nj5m1n/kommentary")
    use("ThePrimeagen/harpoon")
    use({
        "TimUntersberger/neogit",
        requires = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
    })
    use("vim-scripts/auto-pairs-gentle") -- bracket autocompletion

    -- Fancier statusline
    use({
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            "arkav/lualine-lsp-progress",
        },
    })

    -- LSP Client
    use("neovim/nvim-lspconfig")

    -- Language Server installer
    use({
        "williamboman/nvim-lsp-installer",
        requires = "neovim/nvim-lspconfig",
    })

    -- Customizations over LSP
    -- Show VSCode-esque pictograms
    use("onsails/lspkind-nvim")
    -- show various elements of LSP as UI
    use({ "tami5/lspsaga.nvim", requires = { "neovim/nvim-lspconfig" } })

    -- Autocompletion plugin
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
    })

    -- snippets
    use({
        "hrsh7th/cmp-vsnip",
        requires = {
            "hrsh7th/vim-vsnip",
            "rafamadriz/friendly-snippets",
        },
    })

    use("mfussenegger/nvim-jdtls")
    use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use("nvim-telescope/telescope-ui-select.nvim")
    -- Debugging
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("nvim-treesitter/nvim-treesitter")
    use({ "NTBBloodbath/rest.nvim", requires = { "nvim-lua/plenary.nvim" } })
    use("andreshazard/vim-freemarker")

    -- colorschemes
    use("folke/tokyonight.nvim")
    use("morhetz/gruvbox")
    use("luisiacc/gruvbox-baby")
end)
