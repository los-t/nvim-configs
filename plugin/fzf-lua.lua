vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons.git',
  'https://github.com/ibhagwan/fzf-lua.git'
})

require("fzf-lua").setup({ 'default', previewers = { git_diff = { pager = [[delta --color-only]] } } })
