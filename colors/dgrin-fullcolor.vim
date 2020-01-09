hi clear
set bg=dark
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "dgrin-fullcolor"

hi Normal           gui=none   guifg=#86df8c guibg=#0b1722
hi Visual           gui=none                 guibg=#3f3f3f

"15151f
hi LineNr           gui=none   guifg=#004040 guibg=#0b1722
hi CursorLineNr                guifg=#009999 guibg=#142a3f
hi CursorLine                                guibg=#142a3f
hi ColorColumn                               guibg=#142a3f

hi Pmenu            gui=none   guifg=#26af03 guibg=#1b1712
hi PmenuSel         gui=none   guifg=#00ff03 guibg=#142a3f
hi PmenuSbar        gui=none   guifg=#26af03 guibg=#1b1712
hi PmenuThumb       gui=none   guifg=#26af03 guibg=#1b1712

hi StatusLine       gui=none   guifg=#86df8c guibg=#333333
hi StatusLineNC     gui=none   guifg=#006060 guibg=#333333
hi VertSplit        gui=none   guifg=#333333 guibg=#0b1722
hi SignColumn       gui=none                 guibg=#0b1722
hi Title            gui=none   guifg=#888888 guibg=#333333
hi TabLine          gui=none   guifg=#888888 guibg=#333333
hi TabLineFill      gui=none   guifg=#000000 guibg=#333333
hi TabLineSel       gui=bold   guifg=#86df8c guibg=#333333
hi Folded           gui=none   guifg=#888888 guibg=#15151f
hi FoldedColumn     cterm=none      ctermfg=65  ctermbg=237

hi DiffAdd          cterm=none      ctermfg=0   ctermbg=72
hi DiffChange       cterm=none      ctermfg=0   ctermbg=139
hi DiffDelete       cterm=none      ctermfg=123 ctermbg=246
hi DiffText         cterm=none      ctermfg=10  ctermbg=125

hi MatchParen                  guifg=#ffffff guibg=#244a4f

" basics groups
hi Statement        gui=none   guifg=#cccc00
hi Type             gui=none   guifg=#999999
hi Constant         gui=none   guifg=#ccccff
hi Identifier       gui=none   guifg=#666699
hi Comment          gui=italic guifg=#666655
hi String           gui=italic guifg=#996600
hi Number                      guifg=#cc6633
hi Operator         gui=bold   guifg=#dddddd

hi Include          gui=italic guifg=#996666
hi PreCondit        gui=none   guifg=#445577
hi PreProc                     guifg=#44aadd

"syntax match OperatorChars "?\|+\|-\|\*\|;\|:\|,\|<\|>\|&\||\|!\|\~\|%\|=\|)\|(\|{\|}\|\.\|\[\|\]\|/\(/\|*\)\@!"
"hi OperatorChars guifg=#338866

hi lscCurrentParameter gui=bold
hi lscReference gui=bold


