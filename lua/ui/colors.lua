local M = {}
local opt = vim.o
local api = vim.api


scheme = "light"


M.toggle_variant = function()
    if scheme == "light" then
        scheme = "mirage"
        opt.background = "dark"
    else
        scheme = "light"
        opt.background = "light"
    end

    vim.cmd("colorscheme ayu-" .. scheme)
end

M.setup = function()
    require('ayu').setup({
        mirage = true,
    })
    M.toggle_variant()
end


return M
