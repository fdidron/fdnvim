local M = {}
--- Setup language servers.
--- Dependencies:
---     Lua: brew install lua-language-server
---     Emmet: npm install -g emmet-ls
---     Typescript: npm install -g typescript typescript-language-server
---     Tailwind: npm install -g @tailwindcss/language-server
---     Ruby: gem install solargraph
---     Cucumber: npm install -g @cucumber/language-server
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
                    globals = {'vim', 'runtime_path', 'nmap', 'inoremap'},
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
    --- Typescript
    require'lspconfig'.tsserver.setup{}

    --- Go
    require'lspconfig'.gopls.setup{}

    --- Ruby
    require'lspconfig'.solargraph.setup{}

    --- Tailwind
    require'lspconfig'.tailwindcss.setup{}

    --- Emmet
    require'lspconfig'.emmet_ls.setup{}

    --- Cucumber
    require'lspconfig'.cucumber_language_server.setup{}

    ---Icons
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

return M
