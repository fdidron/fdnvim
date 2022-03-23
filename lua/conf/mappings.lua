require'mapx'.setup{ global = true }
local buf = vim.lsp.buf


--Nav
--nmap("<Leader>d", ":SidebarNvimToggle<CR>", "silent")
nmap("<Leader>f", ":Telescope find_files<CR>", "silent")
nmap("<Leader><Leader>f", ":Telescope file_browser path=%:p:h<CR>", "silent")
nmap("<Leader>b", ":Telescope buffers<CR>", "silent")
--nmap("<Leader>b", ":BufferPick<CR>", "silent")
--nmap("<Leader>c", ":Cheat<CR>", "silent")
nmap("<Leader>i", "gg=G``", "silent")
--nmap("<Leader>q", ":bw!<CR>", "silent")

nmap("<Leader><Tab>", "<C-^>", "silent")
nmap("<Leader>j", "<C-W><C-J>")
nmap("<Leader>k", "<C-W><C-K>")
nmap("<Leader>l", "<C-W><C-L>")
nmap("<Leader>h", "<C-W><C-H>")
nmap("<Leader><Leader>j", ":sp<CR><Leader>j", "silent")
nmap("<Leader><Leader>l", ":vsp<CR><Leader>l", "silent")
nmap("<Leader>w", ":HopWord<CR>", "silent")

--Misc
nmap("<Leader><Leader>c", ":lua require'ui/colors'.toggle_variant()<CR>", "silent")
--Windows
--Terminals
--tnoremap("<Esc>", [[<C-\><C-n>]])

--Formatting

--Easy align
--nmap("ga", "<Plug>(EasyAlign)")
--xmap("ga", "<Plug>(EasyAlign)")

--LSP
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
