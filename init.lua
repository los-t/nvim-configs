vim.cmd [[filetype plugin on]]
vim.cmd [[filetype indent on]]
vim.cmd [[syntax on]]

vim.cmd [[colorscheme dgrin-fullcolor]]
vim.o.termguicolors = true
vim.o.guifont = "Fira Code Retina:h12"
vim.o.backspace = "indent,eol,start"

vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
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

vim.api.nvim_exec([[
"if exists("g:neovide")
"  set guifont=Fira\ Code\ Retina:h16
"  let g:neovide_cursor_animation_length=0.01
"  let g:neovide_window_scroll_animation_length=0
"  let g:neovide_window_position_animation_length=0
"endif

if has("win32")
  set mouse=a
endif

"--------- Key Mappings -------
"noremap <leader>l :ls<CR>:b<space>
noremap <leader>l :Telescope buffers<CR>
noremap <leader>f :Telescope git_files<CR>
noremap <leader>nh :nohls<CR>
noremap <leader>cd :lcd %:p:h<CR>

map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Man and Help
if has("unix")
  runtime! ftplugin/man.vim
  nmap <expr> <leader>m ':Man 3 '.expand('<cword>').'<cr>'
endif
"nmap <expr> <leader>h ':help '.expand('<cword>').'<cr>'

" Window management
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" File browser
let g:loaded_netrwPlugin = 1 " don't interfere with filebeagle
let g:filebeagle_suppress_keymaps = 1
map <silent> - <Plug>FileBeagleOpenCurrentBufferDir
noremap <leader>e :vsplit<bar>FileBeagleBufferDir<CR>

" Terminal setup
if has("win32")
  noremap <leader>tb :vsplit<bar>term git-cmd.exe --no-cd --command=usr/bin/bash.exe -l -i<CR>i
  noremap <leader>tw :vsplit<bar>term<CR>i
  noremap <leader>tl :vsplit<bar>term bash -i<CR>i
else
  noremap <leader>tb :vsplit<bar>term<CR>i
endif
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * setlocal statusline=%{b:term_title}

if has("unix")
  " Poormans fzy.vim
  function! FzyCommand(choice_command, vim_command) abort
    let l:callback = {
                \ 'window_id': win_getid(),
                \ 'filename': tempname(),
                \ 'vim_command':  a:vim_command
                \ }

    function! l:callback.on_exit(job_id, data, event) abort
      if a:data == 0 " don't touch buffer if term window closed manually (e.g. with :q)
        bdelete!
        call win_gotoid(self.window_id)
        if filereadable(self.filename)
          try
            let l:selected_filenames = readfile(self.filename)
            if !empty(l:selected_filenames)
              exec self.vim_command . l:selected_filenames[0]
            endif
          catch /E684/
          endtry
        endif
        call delete(self.filename)
      endif
    endfunction

    botright 10 new
    let l:term_command = a:choice_command . ' | fzy > ' .  l:callback.filename
    silent call termopen(l:term_command, l:callback)
    setlocal nonumber norelativenumber
    startinsert
  endfunction

  nnoremap <silent> <leader>o :call FzyCommand('rg --files .', ':edit ')<cr>
  nnoremap <silent> <leader>v :call FzyCommand('rg --files .', ':vsplit ')<cr>
  nnoremap <silent> <leader>t :call FzyCommand('rg --files .', ':tabnew ')<cr>
endif

" Plugins
let g:ctrlsf_default_root = "project"
let g:ctrlsf_ackprg = "rg"
let g:ctrlsf_auto_close = { "normal": 0, "compact": 0 }
let g:ctrlsf_auto_focus = { "at": "start" }
let g:ctrlsf_indent = 2
"partial mapping override does not work for some reason
"let g:ctrlsf_mapping = { "prev": "N", "next": "n" }
nnoremap <leader>/ :CtrlSF 
"nnoremap <silent> <leader>* :CtrlSF<cr>
"nnoremap <silent> <leader>f :CtrlSFToggle<cr>
nnoremap <silent> <leader>* :Telescope grep_string<cr>

packloadall
silent! helptags ALL
]], false)

require'lspconfig'.clangd.setup{}
vim.api.nvim_exec([[
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>o  <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
autocmd Filetype cpp set omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype c set omnifunc=v:lua.vim.lsp.omnifunc
]], false)

-- Completion
vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = true,
  source = {
    path = true,
    tags = true,
    nvim_lsp = true,
    nvim_lua = true
  },
}

-- TreeSitter
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp" },
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

require'gitsigns'.setup { }