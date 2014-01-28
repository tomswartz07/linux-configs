syntax enable
set background=dark
nmap <F8> :TagbarToggle<CR>
nmap <F9> :%s/\s\+$//<CR>
nmap <F12> :Tabularize /=>/l1<CR>
filetype plugin indent on

" Change Tab settings
autocmd FileType commitmsg setlocal textwidth=72
autocmd FileType mail setlocal textwidth=0 spell
autocmd FileType puppet setlocal tabstop=2|set shiftwidth=2|set expandtab

" Override Filetype settings
autocmd BufNewFile,BufRead *.md setfiletype markdown

set laststatus=2
set encoding=utf-8
set t_Co=256
set number
set relativenumber

" Make 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Highlight whitespace errors
match ErrorMsg '\s\+$'
match ErrorMsg '/ \+\ze\t'

" Custom Colorscheme options
highlight SpellBad cterm=underline,bold ctermfg=red

" Use different theme for VimDiff
if &diff
	colorscheme evening
endif

set iskeyword=-,:,@,48-57,_,192-255

let g:tagbar_type_puppet = {
    \ 'ctagstype': 'puppet',
    \ 'kinds': [
        \'c:class',
        \'s:site',
        \'n:node',
        \'d:definition'
      \]
    \}

"Config for vim-airline
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
set ttimeoutlen=50
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
