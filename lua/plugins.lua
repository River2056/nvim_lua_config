local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    "nvim-lua/plenary.nvim",     -- Common utilities
    "kyazdani42/nvim-tree.lua",
    "kyazdani42/nvim-web-devicons", -- File icons
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "simrat39/symbols-outline.nvim",
    "norcalli/nvim-colorizer.lua",
    "kylechui/nvim-surround",
    "b3nj5m1n/kommentary",
    "ThePrimeagen/harpoon",

    -- neogit
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
    },
    "f-person/git-blame.nvim",
    "vim-scripts/auto-pairs-gentle", -- bracket autocompletion

    -- Fancier statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
            "arkav/lualine-lsp-progress",
        },
    },

    -- LSP Client
    "neovim/nvim-lspconfig",
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
    },
    -- Language Server installer
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "MunifTanjim/prettier.nvim",

    -- Customizations over LSP
    -- Show VSCode-esque pictograms
    "onsails/lspkind-nvim",
    -- show various elements of LSP as UI
    { "tami5/lspsaga.nvim",              dependencies = { "neovim/nvim-lspconfig" } },

    -- Autocompletion plugin
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
    },

    -- snippets
    {
        "hrsh7th/cmp-vsnip",
        dependencies = {
            "hrsh7th/vim-vsnip",
            "rafamadriz/friendly-snippets",
        },
    },

    "mfussenegger/nvim-jdtls",
    "jose-elias-alvarez/null-ls.nvim", -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    -- Debugging
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    { "nvim-treesitter/nvim-treesitter", build = "TSUpdate" },
    { "NTBBloodbath/rest.nvim",          dependencies = { "nvim-lua/plenary.nvim" } },
    "andreshazard/vim-freemarker",

    -- colorschemes
    "folke/tokyonight.nvim",
    -- use("morhetz/gruvbox")
    { "ellisonleao/gruvbox.nvim" },
    "luisiacc/gruvbox-baby",
    "windwp/nvim-ts-autotag",
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
    },
    { "romgrk/barbar.nvim",      dependencies = "nvim-web-devicons" },
    "mbbill/undotree",
    "https://gitlab.com/schrieveslaach/sonarlint.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)
