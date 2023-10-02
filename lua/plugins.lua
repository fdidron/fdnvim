--f Bootstrap lazy vim
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
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "zbirenbaum/copilot.lua",
    "sbdchd/neoformat",
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    {
    'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        -- optionally, override the default options:
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
        end
    },
    -- UI
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "nvim-lualine/lualine.nvim",
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    { "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "go", "svelte", "typescript", "javascript", "html", "rust" },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true }
            })
        end
    },
    { 'echasnovski/mini.nvim', version = false },
    -- PM
    "ahmedkhalf/project.nvim",
    "notjedi/nvim-rooter.lua",

    --Git
    "lewis6991/gitsigns.nvim",
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    --Nav
    "ggandor/leap.nvim"

})

local telescope = require('telescope')

-- Mason
require("mason").setup()

vim.cmd("colorscheme catppuccin-mocha")
-- Project
require("project_nvim").setup()
require("nvim-rooter").setup()

-- Telescope
telescope.load_extension('projects')
telescope.load_extension('file_browser')
telescope.load_extension('fzf')

--Git
require('gitsigns').setup()

-- Leap
require("leap").add_default_mappings()

-- Mini
require("mini.animate").setup()

require("copilot").setup({
    suggestion = {
        enable = true,
        auto_trigger = true,
        keymap = { accept = "<C-Space>", dismiss = "<C-k>" } }
})
