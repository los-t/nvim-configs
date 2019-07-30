filetype plugin on
syntax on
colorscheme dgrin-fullcolor
set termguicolors

set vb t_vb=
set backspace=indent,eol,start

set shiftwidth=2
set tabstop=2
set smarttab

set foldenable
set foldmethod=syntax

set autoindent
set cindent

set showmatch

set nu
set cursorline
set colorcolumn=100
set scrolloff=5

set ignorecase

" Status line
set laststatus=2

" QuickFix and Make
set switchbuf=useopen,usetab,newtab


"--------- Key Mappings -------
let mapleader=' '

map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Man and Help
runtime! ftplugin/man.vim
nmap <expr> <leader>m ':Man 3 '.expand('<cword>').'<cr>'
nmap <expr> <leader>h ':help '.expand('<cword>').'<cr>'

" Window management
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" File browser
nnoremap <leader>v :Vexplore<cr>

" Poormans fzy.vim
function! FzyCommand(choice_command, vim_command) abort
  let l:callback = {
              \ 'window_id': win_getid(),
              \ 'filename': tempname(),
              \  'vim_command':  a:vim_command
              \ }

  function! l:callback.on_exit(job_id, data, event) abort
    bdelete!
    call win_gotoid(self.window_id)
    if filereadable(self.filename)
      try
        let l:selected_filename = readfile(self.filename)[0]
        exec self.vim_command . l:selected_filename
      catch /E684/
      endtry
    endif
    call delete(self.filename)
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


" Plugins
let g:signify_vcs_list = ['git']

let g:ctrlsf_default_root = "project"
let g:ctrlsf_ackprg = "/usr/bin/rg"
let g:ctrlsf_auto_close = { "normal": 0, "compact": 0 }
let g:ctrlsf_auto_focus = { "at": "start" }
let g:ctrlsf_indent = 0
let g:ctrlsf_mapping = { "prev": "N", "next": "n" }
nnoremap <leader>/ :CtrlSF 
nnoremap <silent> <leader>* :CtrlSF<cr>
nnoremap <silent> <leader>f :CtrlSFToggle<cr>


packloadall
