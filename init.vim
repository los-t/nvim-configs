filetype plugin on
filetype indent on
syntax on
set termguicolors
if exists("g:neovide")
  set guifont=Fira\ Code\ Retina:h16
  let g:neovide_cursor_animation_length=0.01
  let g:neovide_window_scroll_animation_length=0
  let g:neovide_window_position_animation_length=0
else
  set guifont=Fira\ Code\ Retina:h12
endif
colorscheme dgrin-fullcolor
set clipboard+=unnamedplus

set vb t_vb=
set backspace=indent,eol,start

set shiftwidth=2
set tabstop=2
set smarttab
set expandtab

set foldenable
set foldmethod=syntax

set autoindent
set cindent
set cinoptions=N-s

set showmatch

set nu
set cursorline
set colorcolumn=100
set signcolumn=yes
set scrolloff=5

set ignorecase

" Status line
set laststatus=2

" QuickFix and Make
set switchbuf=useopen,usetab,newtab

set title titlestring=%f

set formatoptions+=j

if has("win32")
  set mouse=a
endif

set hidden

"--------- Key Mappings -------
let mapleader=" "
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
nmap <expr> <leader>h ':help '.expand('<cword>').'<cr>'

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
let g:signify_vcs_list = ['git']

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

lua require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}
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

" Completion
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" TreeSitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
lua << EOF
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
EOF
