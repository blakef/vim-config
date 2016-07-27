" Sourced this from the blog at:
" http://unlogic.co.uk/posts/vim-python-ide.html

set tabstop=4 shiftwidth=4 expandtab
syntax on
set nocompatible
set nu
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'digitaltoad/vim-jade'
Bundle 'othree/yajs.vim'
Bundle 'leafgarland/typescript-vim'

" Jedi
let g:jedi#popup_on_dot=0

" Supertab
let g:SuperTabDefaultCompletionType="context"

" Linting
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint']

" Python Lint
let pymode_lint_ignore="E1122"
" Disable pylint checking every save
let g:pymode_lint_write = 0
let g:pymode_run_key = 'R'
let g:pymode_virtualenv = 1

" The bundles you install will be listed here
filetype plugin indent on

map <F2> :NERDTreeToggle<CR>

" Powerline
set guifont=DejaVu\ Sans\ Mono\ for\ PowerLine\ 9
set laststatus=2
set t_Co=256

" Python-mode
" Activate rope
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Backspace on insertion mode
set backspace=2

" 120 Character limit
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" And set some nice chars to do it with
set listchars=tab:»\ ,eol:¬
