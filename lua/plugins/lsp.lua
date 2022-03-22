local M = {}
--- Setup language servers.
--- Dependencies:
---     LUA: brew install lua-language-server
M.setup = function()

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

--- LUA
require'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = runtime_path,
            },
            diagnostics = {
                globals = {'vim', 'runtime_path', 'nmap'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
end

return M
