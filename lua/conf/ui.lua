local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local ui = {}

cmd 'colorscheme spaceduck'
opt.number = true
opt.termguicolors = true

require('lualine').setup {
  options = {
    theme = "spaceduck"
  }
}

require'nvim-tree'.setup {}

--Dashboard
g.dashboard_default_executive = "telescope"


--Terminal
require('nvim-terminal').setup({

  position = "botright",
  split = "sp",
  height = "30",
  toggle_keymap = "<Leader>s",
  terminals = {
        -- keymaps to open nth terminal
        {keymap = '<leader>n1'},
        {keymap = '<leader>n2'},
        {keymap = '<leader>n3'},
        {keymap = '<leader>n4'},
        {keymap = '<leader>n5'},
    },

})

return ui
