vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  source = {
    path = false,
    tags = true,
    nvim_lsp = true,
    nvim_lua = true
  },
}
