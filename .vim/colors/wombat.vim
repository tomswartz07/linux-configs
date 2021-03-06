" Vim color file
" Original Maintainer:  Lars H. Nielsen (dengmao@gmail.com)
" Last Change:  2015-12-15
"
" Modified version of wombat for 256-color terminals by
"   David Liang (bmdavll@gmail.com)
" based on version by
"   Danila Bespalov (danila.bespalov@gmail.com)
" Further modified by Tom Swartz (tom@tswartz.net)

set background=dark

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let colors_name = "wombat"


" General colors
hi Normal       ctermfg=252     ctermbg=234     cterm=none      guifg=#e3e0d7   guibg=#242424   gui=none
hi Cursor       ctermfg=234     ctermbg=228     cterm=none      guifg=#242424   guibg=#eae788   gui=none
hi Visual       ctermfg=251     ctermbg=239     cterm=none      guifg=#c3c6ca   guibg=#554d4b   gui=none
hi VisualNOS    ctermfg=251     ctermbg=236     cterm=none      guifg=#c3c6ca   guibg=#303030   gui=none
hi Search       ctermfg=177     ctermbg=241     cterm=none      guifg=#d787ff   guibg=#636066   gui=none
hi Folded       ctermfg=103     ctermbg=237     cterm=none      guifg=#a0a8b0   guibg=#3a4046   gui=none
hi Title        ctermfg=230                     cterm=bold      guifg=#ffffd7                   gui=bold
hi StatusLine   ctermfg=230     ctermbg=238     cterm=italic    guifg=#ffffd7   guibg=#444444   gui=italic
hi VertSplit    ctermfg=238     ctermbg=238     cterm=none      guifg=#444444   guibg=#444444   gui=none
hi StatusLineNC ctermfg=241     ctermbg=238     cterm=none      guifg=#857b6f   guibg=#444444   gui=none
hi LineNr       ctermfg=241     ctermbg=232     cterm=none      guifg=#857b6f   guibg=#080808   gui=none
hi CursorLineNr ctermfg=228		ctermbg=232		cterm=italic	guifg=#857b6f	guibg=#080808	gui=italic
hi SpecialKey   ctermfg=241     ctermbg=235     cterm=none      guifg=#626262   guibg=#2b2b2b   gui=none
hi WarningMsg   ctermfg=203                                     guifg=#ff5f55
hi ErrorMsg     ctermfg=196     ctermbg=236     cterm=bold      guifg=#ff2026   guibg=#3a3a3a   gui=bold

" Vim >= 7.0 specific colors
if version >= 700
hi CursorLine                   ctermbg=236     cterm=none                      guibg=#32322f
hi MatchParen   ctermfg=228     ctermbg=101     cterm=bold      guifg=#eae788   guibg=#857b6f   gui=bold
hi Pmenu        ctermfg=230     ctermbg=238                     guifg=#ffffd7   guibg=#444444
hi PmenuSel     ctermfg=232     ctermbg=192                     guifg=#080808   guibg=#cae982
endif

" Diff highlighting
hi DiffAdd                      ctermbg=17                                      guibg=#2a0d6a
hi DiffDelete   ctermfg=234     ctermbg=60      cterm=none      guifg=#242424   guibg=#3e3969   gui=none
hi DiffText                     ctermbg=53      cterm=none                      guibg=#73186e   gui=none
hi DiffChange                   ctermbg=237                                     guibg=#382a37

" vim-gitgutter highlighting
hi GitGutterAdd 				ctermfg=113 ctermbg=232 guifg=#95e454 guibg=#080808
hi GitGutterChange 				ctermfg=203 ctermbg=232 guifg=#d7875f guibg=#080808
hi GitGutterDelete 				ctermfg=196 ctermbg=232 guifg=#ff2026 guibg=#080808
hi GitGutterChagneDelete 		ctermfg=52  ctermbg=232 guifg=#5f0000 guibg=#080808

" Color Column, highlight the 81st column
call matchadd('ColorColumn', '\%81v', 100)
hi ColorColumn                  ctermbg=52                                      guibg=#5f0000

"hi CursorIM
"hi Directory
"hi IncSearch
"hi Menu
"hi ModeMsg
"hi MoreMsg
"hi PmenuSbar
"hi PmenuThumb
"hi Question
"hi Scrollbar
"hi SpellBad
"hi SpellCap
"hi SpellLocal
"hi SpellRare
"hi TabLine
"hi TabLineFill
"hi TabLineSel
"hi Tooltip
"hi User1
"hi User9
"hi WildMenu

" Custom Formatting
hi SpellBad     ctermfg=203     ctermbg=234     cterm=underline,bold       guifg=#ff5f55        gui=underline,bold
hi SpellRare    ctermfg=203     ctermbg=234     cterm=underline,bold       guifg=#4A412A        gui=underline,bold
hi SpellLocal   ctermfg=203     ctermbg=234     cterm=underline,bold       guifg=#4A412A        gui=underline,bold

" Syntax highlighting
hi Keyword      ctermfg=111     cterm=none      guifg=#88b8f6   gui=none
hi Statement    ctermfg=111     cterm=none      guifg=#88b8f6   gui=none
hi Constant     ctermfg=173     cterm=none      guifg=#d7875f   gui=none
hi Number       ctermfg=173     cterm=none      guifg=#d7875f   gui=none
hi PreProc      ctermfg=173     cterm=none      guifg=#d7875f   gui=none
hi Function     ctermfg=192     cterm=none      guifg=#cae982   gui=none
hi Identifier   ctermfg=192     cterm=none      guifg=#cae982   gui=none
hi Type         ctermfg=186     cterm=none      guifg=#d4d987   gui=none
hi Special      ctermfg=229     cterm=none      guifg=#eadead   gui=none
hi String       ctermfg=113     cterm=italic    guifg=#95e454   gui=italic
hi Comment      ctermfg=246     cterm=italic    guifg=#9c998e   gui=italic
hi Todo         ctermfg=101     cterm=italic    guifg=#857b6f   gui=italic


" Links
hi! link FoldColumn     Folded
hi! link CursorColumn   CursorLine
hi! link NonText        LineNr
hi! link SignColumn     LineNr

" vim:set ts=4 sw=4 noet:
