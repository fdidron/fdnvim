-- Bootstrap lazy vim
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

-- Then use it to load some plugins
require("lazy").setup({
    -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "github/copilot.vim",
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    -- UI
    "Shatur/neovim-ayu",
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
    },
    { "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "go", "svelte", "typescript", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end},
    "declancm/cinnamon.nvim",
    -- PM
    "ahmedkhalf/project.nvim",

    --Git
    "lewis6991/gitsigns.nvim",
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

})

local telescope = require('telescope')

-- Mason
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end
}

-- Ayu Theme
local ayu = require("ayu")
ayu.setup({
    mirage = true,
    overrides = {},
})
ayu.colorscheme()

-- Project
require("project_nvim").setup()

-- Telescope
telescope.load_extension('projects')
telescope.load_extension('file_browser')

-- Smooth scrolling
require('cinnamon').setup()

--Git
require('gitsigns').setup()
