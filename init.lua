local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.cmd [[filetype plugin on]]

vim.g.mapleader = " " -- Must be before call to Lazy.nvim
require("lazy").setup("plugins")

vim.cmd [[filetype indent on]]
vim.cmd [[syntax on]]

vim.o.guifont = "FiraCode Nerd Font Mono:h12,Fira Code:h12"
vim.o.backspace = "indent,eol,start"

vim.bo.shiftwidth = 2
vim.o.shiftwidth = 2
vim.bo.tabstop = 2
vim.o.tabstop = 2
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.fixeol = false

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

if vim.fn.has("win32") then
  vim.g.mouse = "a"
end

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

-- Additional filetypes
vim.filetype.add({
  extension = {
    dshl = 'hlsl',
    frag = 'glsl',
    vert = 'glsl',
  }
})

-- Selective autoformat on save
vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  group = 'AutoFormatting',
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
