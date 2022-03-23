local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- Utils
    use 'wbthomason/packer.nvim'
    use 'b0o/mapx.nvim'

    -- Language support
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-buffer'
    use 'lukas-reineke/cmp-rg'
    use 'quangnguyen30192/cmp-nvim-tags'
    use 'ray-x/cmp-treesitter'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'nvim-treesitter/nvim-treesitter'
    use 'windwp/nvim-autopairs'

    -- UI
    use 'Shatur/neovim-ayu'
    use 'karb94/neoscroll.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'norcalli/nvim-colorizer.lua'
    use 'goolord/alpha-nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'folke/which-key.nvim'
    use 'lukas-reineke/indent-blankline.nvim'

    -- Nav
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'psliwka/vim-smoothie'

    -- Motion
    use 'phaazon/hop.nvim'
    use 'nacro90/numb.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if Packer_bootstrap then
        require'packer'.sync()
    end

    -- Run plugin configs
    require'plugins/lsp'.setup()
    require'plugins/autocomplete'.setup()
    require'plugins/treesitter'.setup()
    require'plugins/telescope'.setup()
    require'plugins/indent'.setup()
    require'ui/colors'.setup()
    require'ui/dashboard'.setup()
    require'which-key'.setup()
    require'hop'.setup()
    require'numb'.setup()
    require'gitsigns'.setup()
    require'nvim-web-devicons'.setup()
    require'colorizer'.setup()
    require'nvim-autopairs'.setup()
end)
