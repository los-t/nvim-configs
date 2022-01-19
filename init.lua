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

-- Key Mappings

local key_map = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap=true, silent=true })
end

key_map("n", "<leader>l", ":Telescope buffers<CR>")
key_map("n", "<leader>f", ":Telescope git_files<CR>")
key_map("n", "<leader>*", ":Telescope grep_string<CR>")

key_map("n", "<leader>gb", ":Telescope git_bcommits<CR>")
key_map("n", "<leader>gl", ":Telescope git_commits<CR>")
key_map("n", "<leader>gs", ":Telescope git_stash<CR>")
key_map("n", "<leader>gd", ":Telescope git_status<CR>")

key_map("n", "<leader>r", ":Telescope lsp_references<CR>")

key_map("n", "<leader>nh", ":nohls<CR>")
key_map("n", "<leader>cd", ":lcd %:p:h<CR>")

key_map("n", "<C-h>", "<C-w>h")
key_map("n", "<C-j>", "<C-w>j")
key_map("n", "<C-k>", "<C-w>k")
key_map("n", "<C-l>", "<C-w>l")

key_map("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>")
key_map("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>")
key_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
key_map("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>")
key_map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
key_map("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
key_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
key_map("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
key_map("n", "<leader>o", "<cmd>lua vim.diagnostic.open_float(0, {scope=\"line\", border=\"single\"})<CR>")

key_map("n", "-", ":FileBeagleBufferDir<CR>")
key_map("n", "<leader>e", ":vsplit<bar>FileBeagleBufferDir<CR>")

key_map("t", "<Esc>", "<C-\\><C-n>")
if (vim.fn.has("win32")) then
  key_map("n", "<leader>tb", ":vsplit<bar>term git-cmd.exe")
  key_map("n", "<leader>tw", ":vsplit<bar>term<CR>i")
  key_map("n", "<leader>tl", ":vsplit<bar>term bash -i<CR>i")
else
  key_map("n", "<leader>tb", ":vsplit<bar>term<CR>i")
end

vim.api.nvim_exec([[
if exists("g:neovide")
  let g:neovide_cursor_animation_length=0
  let g:neovide_window_scroll_animation_length=0
  let g:neovide_window_position_animation_length=0
endif
]], false)

-- Terminal setup
vim.api.nvim_command([[autocmd TermOpen * setlocal statusline=%{b:term_title}]])
