syntax on
nmap <F8> :TagbarToggle<CR>
nmap <F9> :%s/\s\+$//<CR>
nmap <F12> :Tabularize /=>/l1<CR>

" Highlight whitespace errors
match ErrorMsg '\s\+$'
match ErrorMsg '/ \+\ze\t'

set laststatus=2
set encoding=utf-8
set t_Co=256
set number

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
