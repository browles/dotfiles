" ---------- Plugins ----------

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'browles/vim-sublime-monokai'
Plug 'dense-analysis/ale'
Plug 'dmac/vim-cljfmt'
Plug 'fatih/vim-go'
Plug 'guns/vim-clojure-highlight'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'psf/black', {'branch': 'stable'}
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-surround'

call plug#end()

filetype plugin indent on

" ---------- General ----------

colorscheme sublimemonokai

" set colorcolumn=80
set cursorline
set autoread                    " reload changed files when focus returns
set background=dark
set backspace=indent,eol,start  " make backspace work correctly
set clipboard=unnamed           " use the OS clipboard for the unnamed register
set cmdheight=1
set completeopt=longest,menuone " popup menu completion options
set expandtab
set foldlevel=99                " open all folds by default
set formatoptions=croql
set hidden                      " allows buffers to be put in bg without saving and allows undo when put in fg
set history=1000
set ignorecase                  " ignore case when searching...
set incsearch                   " perform search as you type
set laststatus=2                " show statusline with filename
set modeline                    " enable modelines
set mouse=a
set nobackup                    " don't save backup files
set nojoinspaces
set noshowmode
set noswapfile                  " don't create .swp files
set nowritebackup               " don't save backup files
set number                      " show line numbers
set ruler                       " show cursor position, etc.
set scrolloff=5                 " scroll when 5 lines away from edge of screen
set shiftwidth=2
set showcmd                     " display commands in progress at the bottom
set smartcase                   " ...unless a capital letter was typed
set smarttab
set tabstop=2
set termguicolors
set textwidth=80                " wrap comments
set wildmenu                    " command tab completion menu
set wildmode=list:longest,full  " command tab completion menu options

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25

let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Viminfo saves/restores editing metadata in ~/.viminfo.
" '100   Save marks for the last 100 edited files
" f1     Store global marks
" <500   Save max of 500 lines of each register
" :100   Save 100 lines of command-line history
" /100   Save 100 searches
" h      Disable hlsearch when starting
set viminfo='100,f1,<500,:100,/100,h

" ---------- Mappings ----------

" Make Y behave like C and D (yank to end of line).
nnoremap Y y$

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Emacs navigation for the command menu
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>

" Emacs navigation for insert mode
inoremap <C-f> <Right>
inoremap <C-b> <Left>

" Auto close braces
inoremap {     {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{    {
inoremap {}    {}

inoremap [     []<Left>
inoremap [<CR> [<CR>]<Esc>O
inoremap [[    [
inoremap []    []

inoremap (     ()<Left>
inoremap (<CR> (<CR>)<Esc>O
inoremap ((    (
inoremap ()    ()

" Follow indentation when pasting
nnoremap p ]p
nnoremap <c-p> p

" ---------- Autocommands ----------

augroup git_gutter
  autocmd!
  autocmd BufWritePost * GitGutter
augroup end

augroup trailing_whitespace
  autocmd!
  " remove whitespace at the end of a line
  autocmd BufWritePre * :%s/\s\+$//e
  " remove empty lines at the end of the file
  autocmd BufWritePre * :%s/\($\n\s*\)\+\%$//e
augroup end

" additional filetypes
augroup filetypes
  autocmd!
  autocmd BufNewFile,BufRead *.yml set filetype=ansible
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.tpl set filetype=gotexttmpl
augroup end

" restore cursor position when reopening a file
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup restore_cursor
  autocmd!
  autocmd BufReadPost * call ResCur()
augroup end

" -- Go --
let g:go_fmt_command = "goimports"
let g:go_highlight_format_strings = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0

augroup go
  autocmd!
  autocmd FileType go setlocal nolist
  autocmd FileType go setlocal tabstop=2
  autocmd FileType go setlocal softtabstop=2
  autocmd FileType go setlocal shiftwidth=2
augroup END

" -- Clojure --
let g:cljfmt_on_save = 0
let g:clojure_syntax_keywords = {
      \ 'clojureMacro': ["def-", "-?>", "-?>>"],
      \ }
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

hi link clojureKeyword Special
hi link clojureSpecial Keyword

augroup clojure
  autocmd!
  autocmd FileType clojure setlocal omnifunc=fireplace#omnicomplete
  autocmd FileType clojure RainbowParentheses
augroup END

" -- Python --

hi link pythonImport SublimePink

augroup python
  autocmd!
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal shiftwidth=4
	autocmd BufWritePre *.py execute ':Black'
augroup END

" -- Java --
let java_comment_strings=1
let java_highlight_functions=1
let java_highlight_java_lang_ids=1

" ----------- Misc -------------

function! SynGroup()
let l:s = synID(line('.'), col('.'), 1)
echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" ---------- Liftoff -----------

if $LIFTOFF == 'true'
	" Ensure we use our versioned goimports wrapper from tools/bin rather than
	" whatever version of goimports vim-go installs.
	let g:go_search_bin_path_first = 0
	let g:go_fmt_options = {'goimports': '-local liftoff/'}
	let g:cljfmt_on_save = 1
endif
