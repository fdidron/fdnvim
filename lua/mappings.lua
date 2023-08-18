-- Alt tab on buffers, can't live WIThout this
vim.keymap.set('n', '<Leader><Tab>', '<C-^>')

-- File browsing
vim.keymap.set('n', '<Leader>f', ':Telescope file_browser<CR>')
vim.keymap.set('n', '<Leader>b', ':Telescope buffers<CR>')

-- Indent the current buffer (uses treesitter)
vim.keymap.set('n', '<Leader>i', 'gg=G')

-- Window navigation
vim.keymap.set('n', '<Leader>h', '<C-w>h')
vim.keymap.set('n', '<Leader>j', '<C-w>j')
vim.keymap.set('n', '<Leader>k', '<C-w>k')
vim.keymap.set('n', '<Leader>l', '<C-w>l')

-- Window creation
vim.keymap.set('n', '<Leader><Leader>j', '<C-w>s')
vim.keymap.set('n', '<Leader><Leader>l', '<C-w>v')

