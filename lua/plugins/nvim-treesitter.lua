return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"

    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "c", "cpp", "hlsl", "squirrel", "glsl" },
      highlight = {
        enable = true
      },
      indent = {
        enable = false
      },
      incremental_selection = {
        enable = false
      },
    }
  end,
}
