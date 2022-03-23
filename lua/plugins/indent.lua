local M = {}

M.setup = function()
    require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
        filetype_exclude = {'alpha'}
    }
end

return M
