filetype plugin indent on
syntax enable
set background=dark
set omnifunc=syntaxcomplete#Complete
set completeopt=menu
set splitright
set splitbelow

" Change Tab settings
autocmd FileType commitmsg setlocal textwidth=72 spell
autocmd FileType mail setlocal textwidth=0 spell
autocmd FileType puppet setlocal tabstop=2|set shiftwidth=2|set expandtab

" Override Filetype settings
autocmd BufNewFile,BufRead *.md,*.markdown set filetype=markdown
autocmd BufNewFile,BufRead *.ps1,*.ps set filetype=powershell

" Automatically reload .vimrc files
autocmd BufWritePost .vimrc source %

" UI settings
set laststatus=2
set encoding=utf-8
set t_Co=256
set updatetime=100
set number
set relativenumber
set cursorline
set wildmenu
set smarttab
set expandtab
set autoread
set noshowmode
colorscheme wombat

" Write swap and backup files in the event of a crash or accident
set swapfile
set directory=$TMPDIR,~/.vim/tmp,~/tmp,/tmp,/var/tmp
set backup
set backupdir=$TMPDIR,~/.vim/tmp,~/tmp,/tmp,/var/tmp
"
" Extend undoable steps and preserve over restart (if available)
if has('persistent_undo')
        set undodir=$TMPDIR,~/.vim/tmp,~/tmp,/tmp,/var/tmp
        set undofile
        set undoreload=10000
end
set undolevels=10000

" Use different theme for VimDiff
"if &diff
"       colorscheme evening
"       highlight CursorLine cterm=none ctermbg=236
"endif

" Remove menu options for GVim
if has("gui_running")
    set guioptions -=m
    set guioptions -=T
    set guioptions -=r
    set guioptions -=L
    set guioptions -=l
    set guioptions -=b
    set guifont=Hack\ 8
endif

" Make tabs and trailing whitespace visible, use <Leader>+l to toggle
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

" Join command will act a little smarter
set formatoptions+=j

" Enable par as external formatter, for pretty paragraphs
set formatprg=par\ -w80eq

" Custom commands
" Enable tabs and trailing whitespace visibility
nnoremap <Leader>l :set list!<CR>
" Toggle search highlighting
nnoremap <Leader>S :set hlsearch!<CR>
" Ignore whitespace during VimDiff, only affects current session
nnoremap <Leader>w :set diffopt+=iwhite<CR>
" Toggle line wrapping
nnoremap <Leader>W :set wrap!<CR>
" Toggle spell check
nnoremap <Leader>s :set spell!<CR>
" Use pop-up window for spell check: hit <C-c> to select option
nnoremap z= ea<C-X><C-S>
" Create a new tab
nnoremap <Leader>t :tabnew<CR>
" Toggle NERDTree plugin
nmap <F7> :NERDTreeToggle<CR>
" Toggle Tagbar plugin
nmap <F8> :TagbarToggle<CR>
" Find and replace trailing whitespace
nmap <F9> :%s/\s\+$//<CR>
" Use Tabular Plugin to align elements with Puppet Styleguide
nmap <F12> :Tabularize /=>/l1<CR>
" Easier shifting, keep selection on shift
xnoremap < <gv
xnoremap > >gv
" Move between splits easier
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
noremap <C-k> <C-W>k
noremap <C-j> <C-W>j
" Auto-complete braces
"inoremap { {}<Esc>i
"inoremap [ []<Esc>i
"inoremap ( ()<Esc>i
"" Allow <Leader>+Brace to insert regular brace
"inoremap <Leader>{ {
"inoremap <Leader>[ [
"inoremap <Leader>( (

" Bind :Q and :W to :q and :w
command! Q q
command! W w
command! WQ wq
command! Wq wq

" Command Sw will 'sudo write' the file
" Useful when you forget to open the file as root
command! Sw silent w !sudo tee %

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

" Config for vim-airline
let g:airline_theme='wombat'
let g:airline_powerline_fonts=1
set ttimeoutlen=50
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '№'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.maxlinenr = '№'
let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
"let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#right_sep = '◀'
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#close_symbol = 'vim'
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '▶'
let g:syntastic_full_redraws = 1
let g:syntastic_puppet_puppetlint_args = "--no-autoloader_layout-check --no-80chars-check --no-class_inherits_from_params_class-check"
let g:syntastic_python_pylint_args = "--disable=invalid-name"
let g:syntastic_html_checkers = ["w3"]
let g:syntastic_yaml_checkers = ["yamllint"]
let g:syntastic_yaml_yamllint_args = "-d relaxed"
