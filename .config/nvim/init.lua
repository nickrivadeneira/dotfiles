vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])

require('leap').create_default_mappings()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup()
require('lspconfig').sorbet.setup({})
require('lspconfig').ruby_lsp.setup({})
require('lspconfig').tsserver.setup({})
require('lspconfig').graphql.setup({})
