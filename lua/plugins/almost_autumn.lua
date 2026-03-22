return {
  'los-t/almost_autumn',

  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[set termguicolors]])
    require('almost_autumn').setup()
    vim.cmd([[colorscheme almost_autumn]])
    vim.cmd([[hi TreesitterContextBottom gui=underline guisp=Grey]])
    vim.cmd([[hi TreesitterContextLineNumberBottom gui=underline guisp=Grey]])
  end,
}
