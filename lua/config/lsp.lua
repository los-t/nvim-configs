local caps = require'cmp_nvim_lsp'.default_capabilities()

require'lspconfig'.clangd.setup{
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--cross-file-rename",
  },
  capabilities = caps,
}
require'lspconfig'.tsserver.setup{ capabilities = caps }

require'lsp_signature'.setup({
  bind = true,
  always_trigger = true,
  hint_prefix = '^ ',
})

