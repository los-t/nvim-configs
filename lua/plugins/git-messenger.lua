return {
  'rhysd/git-messenger.vim',
  init = function()
    vim.g.git_messenger_extra_blame_args = '-w'
  end,
}
