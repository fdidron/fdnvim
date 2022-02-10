require'mapx'.setup{ global = true }
ui = require("conf.ui")
local buf = vim.lsp.buf


--Nav
nmap("<Leader>t", ":NvimTreeToggle<CR>", "silent")
nmap("<Leader>f", ":Telescope find_files<CR>", "silent")
nmap("<Leader>o", ":Telescope buffers<CR>", "silent")
nmap("<Leader>b", ":BufferPick<CR>", "silent")
nmap("<Leader>i", "gg=G", "silent")
nmap("<Leader>q", ":bw!<CR>", "silent")
nmap("<Leader><Tab>", "<C-^>", "silent")
nnoremap("<Leader>j", "<C-W><C-J>")
nnoremap("<Leader>k", "<C-W><C-K>")
nnoremap("<Leader>l", "<C-W><C-L>")
nnoremap("<Leader>h", "<C-W><C-H>")

--Windows
--Terminals
tnoremap("<Esc>", [[<C-\><C-n>]])

--Formatting

--Easy align
nmap("ga", "<Plug>(EasyAlign)")
xmap("ga", "<Plug>(EasyAlign)")

nmap('gd', function() buf.definition() end)
nmap('gD', function() buf.declaration() end)
nmap('gi', function() buf.implementation() end)
nmap('gw', function() buf.document_symbol() end)
nmap('gw', function() buf.workspace_symbol() end)
nmap('gr', function() buf.references() end)
nmap('gt', function() buf.type_definition() end)
nmap('K', function() buf.hover() end)
nmap('<c-k>', function() buf.signature_help() end)
nmap('<leader>af', function() buf.code_action() end)
nmap('<leader>rn', function() buf.rename() end)
