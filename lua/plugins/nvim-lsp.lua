return {
  'neovim/nvim-lsp',
  config = function()
    local caps = require'cmp_nvim_lsp'.default_capabilities()
    require'lspconfig'.clangd.setup{
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--cross-file-rename",
        "--limit-references=0",
        "--header-insertion=never",
      },
      capabilities = caps,
    }
    require'lspconfig'.tsserver.setup{ capabilities = caps }
  end,
}
