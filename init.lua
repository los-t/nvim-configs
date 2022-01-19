vim.cmd [[filetype plugin on]]
vim.cmd [[filetype indent on]]
vim.cmd [[syntax on]]

vim.o.guifont = "Fira Code:h14"
vim.o.backspace = "indent,eol,start"

vim.bo.shiftwidth = 2
vim.o.shiftwidth = 2
vim.bo.tabstop = 2
vim.o.tabstop = 2
vim.o.smarttab = true
vim.o.expandtab = true

vim.o.foldenable = true
vim.o.foldmethod = "syntax"

vim.bo.autoindent = true
vim.bo.cindent = true
vim.bo.cinoptions = "N-s"

vim.o.showmatch = true

vim.wo.number = true
vim.o.cursorline = true
vim.o.colorcolumn = "100"
vim.o.signcolumn = "yes"
vim.o.scrolloff = 5

vim.o.ignorecase = true

-- Status line
vim.o.laststatus = 2

-- QuickFix and Make
vim.o.switchbuf = "useopen,usetab,newtab"

vim.o.title = true
vim.o.titlestring = "%f"

vim.o.clipboard = "unnamedplus"
vim.o.hidden = true

vim.g.mapleader = " "
if vim.fn.has("win32") then
  vim.g.mouse = "a"
end

require('plugins')
require('keymap')

vim.api.nvim_exec([[
if exists("g:neovide")
  let g:neovide_cursor_animation_length=0
  let g:neovide_window_scroll_animation_length=0
  let g:neovide_window_position_animation_length=0
endif
]], false)

-- Terminal setup
vim.api.nvim_command([[autocmd TermOpen * setlocal statusline=%{b:term_title}]])
