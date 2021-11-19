require'lspconfig'.clangd.setup{}
require'lspconfig'.tsserver.setup{}
require'lsp_signature'.setup({
  bind = true,
  always_trigger = true,
  hint_prefix = '^ ',
})

