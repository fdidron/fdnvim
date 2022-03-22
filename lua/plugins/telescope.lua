local M = {}

M.setup = function()
require'telescope'.setup {
    extensions = {
        file_browser = {
            theme = "ivy"
        }
    }
}
require("telescope").load_extension "file_browser"
end

return M
