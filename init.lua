vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.cmd.filetype('plugin on')
vim.cmd.filetype('indent on')
vim.cmd.syntax('on')
vim.o.termguicolors = true

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

vim.lsp.enable({
  'clangd',
  'lua_ls',
  'ruff',
})
