local M = {}
local api = vim.api

M.setup = function()
    require'telescope'.setup {
        extensions = {
            file_browser = {
                theme = "ivy"
            }
        }
    }
    require("telescope").load_extension "file_browser"
    -- Autocommand to replace netwrp with telescope file browsedir
    local group = api.nvim_create_augroup("FDVimEnter", { clear = true })
    api.nvim_create_autocmd("VimEnter", {callback = function()
        vim.cmd("if isdirectory(expand('%:p')) | exe 'cd %:p:h' | exe 'bd!'| exe 'Telescope file_browser' | endif")
    end, group = group})
end

return M
