local builtin = require('telescope.builtin')
-- Alt tab on buffers, can't live WIThout this
vim.keymap.set('n', '<Leader><Tab>', '<C-^>')

-- File browsing
vim.keymap.set('n', '<Leader>f', vim.cmd.Ex)
vim.keymap.set('n', '<Leader>b', ':Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>p', ':Telescope projects<CR>')

-- Indent the current buffer 
vim.keymap.set('n', '<Leader>i', ':Neoformat<CR>')

-- Window navigation
vim.keymap.set('n', '<Leader>h', '<C-w>h')
vim.keymap.set('n', '<Leader>j', '<C-w>j')
vim.keymap.set('n', '<Leader>k', '<C-w>k')
vim.keymap.set('n', '<Leader>l', '<C-w>l')

-- Window creation
vim.keymap.set('n', '<Leader><Leader>j', '<C-w>s')
vim.keymap.set('n', '<Leader><Leader>l', '<C-w>v')

-- LazyGit
vim.keymap.set('n', '<Leader><Leader>g', ':LazyGit<CR>')

-- Telescope search
vim.keymap.set('n', '<Leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<Leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<Leader>ps', function()
    builtin.grep_string({search = vim.fn.input("grep:")}) 
end)


