return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({ 'default', previewers = { git_diff = { pager = false } } })
  end
}
