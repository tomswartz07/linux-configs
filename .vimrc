syntax enable
set background=dark
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set completeopt=menu
set splitright

" Change Tab settings
autocmd FileType commitmsg setlocal textwidth=72
autocmd FileType mail setlocal textwidth=0 spell
autocmd FileType puppet setlocal tabstop=2|set shiftwidth=2|set expandtab

" Override Filetype settings
autocmd BufNewFile,BufRead *.md setfiletype markdown

" UI settings
set laststatus=2
set encoding=utf-8
set t_Co=256
set number
set relativenumber
set cursorline
set wildmenu
colorscheme wombat

" Use different theme for VimDiff
if &diff
	colorscheme evening
endif

" Remove menu options for GVim
if has("gui_running")
    set guioptions -=m
    set guioptions -=T
    set guioptions -=r
endif

" Custom Colorscheme options
highlight SpellBad cterm=underline,bold ctermfg=lightgreen ctermbg=darkred
highlight CursorLine cterm=none ctermbg=236

" Make 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Make tabs and trailing whitespace visible, use <leader>+l to toggle
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

" Enable par as external formatter, for pretty paragraphs
set formatprg=par\ -w80eq

" Custom commands
" Enable tabs and trailing whitespace visiblity
nnoremap <Leader>l :set list!<CR>
" Toggle search highlighting
nnoremap <Leader>s :set hlsearch!<CR>
" Create a new tab
nnoremap <Leader>t :tabnew<CR>
" Toggle Tagbar plugin
nmap <F8> :TagbarToggle<CR>
" Find and replace trailing whitespace
nmap <F9> :%s/\s\+$//<CR>
" Use Tabular Plugin to align elemnts with Puppet Styleguide
nmap <F12> :Tabularize /=>/l1<CR>

set iskeyword=-,:,@,48-57,_,192-255

"let g:tagbar_type_puppet = {
"    \ 'ctagstype': 'puppet',
"    \ 'kinds': [
"        \'c:class',
"        \'s:site',
"        \'n:node',
"        \'d:definition'
"      \]
"    \}

"Config for vim-airline
let g:airline_theme='wombat'
let g:airline_powerline_fonts=1
set ttimeoutlen=50
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = '◀'
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#close_symbol = 'vim'
