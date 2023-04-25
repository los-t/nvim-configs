return { 
  'jeetsukumaran/vim-filebeagle',
  cmd = {'FileBeagle', 'FileBeagleBufferDir'},
  init = function()
    vim.g.loaded_netrwPlugin = 1 -- don't interfere with filebeagle
    vim.g.filebeagle_suppress_keymaps = 1
    vim.g.filebeagle_show_hidden = 1
  end,
}
