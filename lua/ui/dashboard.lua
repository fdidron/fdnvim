local M = {}
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
local opt = vim.o
local api = vim.api




M.setup = function()
    dashboard.section.header.val = {
"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
"░░░░░▀▄░░░▄▀░░░░░░░░▄░▀▄░░░▄▀░▄░░░░░░░░░▄██▄░░░░░░░",
"░░░░▄█▀███▀█▄░░░░░░░█▄███████▄█░░░░░░░▄██████▄░░░░░",
"░░░█▀███████▀█░░░░░░███▄███▄███░░░░░░███▄██▄███░░░░",
"░░░█░█▀▀▀▀▀█░█░░░░░░▀█████████▀░░░░░░░░▄▀▄▄▀▄░░░░░░",
"░░░░░░▀▀░▀▀░░░░░░░░░░▄▀░░░░░▀▄░░░░░░░░▀░▀░░▀░▀░░░░░",
"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
}
    dashboard.section.buttons.val = {
        dashboard.button( "f", "  > Find file ", ":Telescope find_files<CR>"),
        dashboard.button( "F", "  > Browse files ", ":Telescope file_browser<CR>"),
        dashboard.button( "r", "  > Recent"   ,  ":Telescope oldfiles<CR>"),
        dashboard.button( "q", "  > Quit NVIM ", ":qa<CR>"),
    }
    local fortune = require("alpha.fortune")
    dashboard.section.footer.val = fortune()
    alpha.setup(dashboard.opts)
end

return M
