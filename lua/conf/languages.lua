require'colorizer'.setup()
require'nvim-autopairs'.setup()


-- Treesitter
local configs = require'nvim-treesitter.configs'

configs.setup {
    ensure_installed = "maintained", -- Only use parsers that are maintained
    highlight = { -- enable highlighting
        enable = true,
    },
    indent = {
        enable = true,
    }
}

-- TODO: Revisit folding later
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
    if server.name == "sumneko_lua" then
        opts = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim', 'use', 'nmap', 'xmap', 'nnoremap', 'execute' }
                    },
                }
            }
        }
    end
end)

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    -- formatting = {
        --     format = lspkind.cmp_format({
            --         mode = 'symbol_text',
            --         maxwidth = 50,

            --         before = function (entry, vim_item)
                --             return vim_item
                --         end
                --     })
                -- },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'calc' },
                    { name = 'treesitter' },
                    { name = 'tags' },
                    { name = 'rg' },
                }),
            })
            -- Use buffer source for '/'
            cmp.setup.cmdline('/', {
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':'
            cmp.setup.cmdline(':', {
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
