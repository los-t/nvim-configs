local daily_used_parsers = {
  "c",
  "cpp",
  "hlsl",
  "squirrel",
  "glsl",
  "cmake",
  "lua",
  "json",
  "yaml",
  "toml",
  "gitcommit",
  "gitignore",
  "git_config",
  "git_rebase",
  "markdown",
  "markdown_inline",
}

return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"

    require'nvim-treesitter.configs'.setup {
      ensure_installed = daily_used_parsers,
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
