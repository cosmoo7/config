require("cosmo.remap")
require("cosmo.lazy")
require("plugins.mason")
local colorscheme = "base16-tokyodark-terminal"
  local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.opt.termguicolors = true
vim.opt.number= true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
require'colorizer'.setup()

vim.opt.wrap = false
require("nvim-tree").setup()
require'cmp'.setup {
    sources = {
    { name = 'nvim_lsp' }
  }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').cssls.setup {
  capabilities = capabilities,
}
local cmp = require('cmp')
 local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) 
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })
local lspconfig = require('lspconfig')
lspconfig.emmet_language_server.setup({
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
  init_options = {
    includeLanguages = {},
    excludeLanguages = {},
    extensionsPath = {},
    preferences = {},
    showAbbreviationSuggestions = true,
    showExpandedAbbreviation = "always",
    showSuggestionsAsSnippets = false,
    syntaxProfiles = {},
    variables = {},
  },
})
