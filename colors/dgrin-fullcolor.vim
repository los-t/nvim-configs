hi clear
set bg=dark
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "dgrin-fullcolor"

hi Normal           gui=none   guifg=#86df8c guibg=#0b1722

"15151f
hi LineNr           gui=none   guifg=#004040 guibg=#0b1722
hi CursorLineNr                guifg=#009999 guibg=#142a3f
hi CursorLine                                guibg=#142a3f
hi ColorColumn                               guibg=#142a3f

hi Pmenu            cterm=none      ctermfg=71  ctermbg=235
hi PmenuSel         cterm=underline ctermfg=10  ctermbg=235
hi PmenuSbar        cterm=none      ctermfg=233 ctermbg=234
hi PmenuThumb       cterm=none      ctermfg=71  ctermbg=72

hi StatusLine       gui=none   guifg=#86df8c guibg=#333333
hi StatusLineNC     gui=none   guifg=#000000 guibg=#333333
hi VertSplit        gui=none   guifg=#333333 guibg=#0b1722
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

hi MatchParen                  guifg=#aaaaaa guibg=#3300aa

" basics groups
hi Statement        gui=none   guifg=#cccc00
hi Type             gui=bold   guifg=#999999
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

