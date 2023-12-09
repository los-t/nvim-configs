return {
  'neovim/nvim-lsp',
  config = function()
    local caps = require'cmp_nvim_lsp'.default_capabilities()
    require'lspconfig'.clangd.setup{
      cmd = {
        "clangd",
        "--background-index",
        "--background-index-priority=low",
        "--clang-tidy",
        "--rename-file-limit=0",
        "--limit-references=0",
        "--header-insertion=never",
        "--all-scopes-completion",
      },
      capabilities = caps,
    }
    require'lspconfig'.tsserver.setup{ capabilities = caps }
  end,
}
