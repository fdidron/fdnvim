local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
    local lua_path = function(name)
        return string.format("require'plugins.%s'", name)
    end

    -- Utils
    use 'wbthomason/packer.nvim'
    use 'b0o/mapx.nvim'

    --Nav
    use 'nvim-lua/plenary.nvim'
    use 'glepnir/dashboard-nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'ggandor/lightspeed.nvim'
    use 'nacro90/numb.nvim'

    --Git
    use 'lewis6991/gitsigns.nvim'

    --UI
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'pineapplegiant/spaceduck'
    use 'romgrk/barbar.nvim'
    use 'psliwka/vim-smoothie'
    use 's1n7ax/nvim-terminal'
    --Formating
    use 'junegunn/vim-easy-align'

    --Language support
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-cmdline'
    use 'ray-x/cmp-treesitter'
    use 'rafamadriz/friendly-snippets'
    use 'lukas-reineke/cmp-rg'
    use 'quangnguyen30192/cmp-nvim-tags'
    --use 'fatih/vim-go'
    use 'tpope/vim-commentary'
    use 'tpope/vim-endwise'
    use 'crivotz/nvim-colorizer.lua'
    use 'windwp/nvim-autopairs'
    use 'ellisonleao/glow.nvim'
end)
