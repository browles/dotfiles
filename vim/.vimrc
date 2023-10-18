" ---------- Plugins ----------
if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')


Plug 'tpope/vim-fireplace'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

Plug 'browles/vim-sublime-monokai'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'


Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'


call plug#end()

filetype plugin indent on

" ---------- General ----------

colorscheme sublimemonokai

" set colorcolumn=80
set cursorline
set autoread                          " reload changed files when focus returns
set background=dark
set backspace=indent,eol,start        " make backspace work correctly
set clipboard=unnamed                 " use the OS clipboard for the unnamed register
set cmdheight=1
set completeopt=longest,menuone,popup " popup menu completion options
set omnifunc=ale#completion#OmniFunc
set expandtab
set foldlevel=99                      " open all folds by default
set formatoptions=croql
set hidden                            " allows buffers to be put in bg without saving and allows undo when put in fg
set history=1000
set ignorecase                        " ignore case when searching...
set smartcase                         " infer case sensitivity from search
set wildignorecase
set incsearch                         " perform search as you type
set laststatus=2                      " show statusline with filename
set modeline                          " enable modelines
set mouse=a
set nobackup                          " don't save backup files
set nojoinspaces
set noshowmode
set noswapfile                        " don't create .swp files
set nowritebackup                     " don't save backup files
set number                            " show line numbers
set ruler                             " show cursor position, etc.
set scrolloff=5                       " scroll when 5 lines away from edge of screen
set shiftwidth=2
set showcmd                           " display commands in progress at the bottom
set smartcase                         " ...unless a capital letter was typed
set smarttab
set tabstop=2
set termguicolors
set textwidth=80                      " wrap comments
set wildmenu                          " command tab completion menu
set wildmode=list:longest,full        " command tab completion menu options

" Improvement to autochdir
" https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
let s:default_path = escape(&path, '\ ') " store default value of 'path'

" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path

" Restore cursor position when reopening a file
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

" Netrw setup
let g:netrw_banner = 0
let g:netrw_browse_split= 0
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

let g:notes_directories = ['~/Dropbox/notes']
let g:notes_smart_quotes = 0

" Viminfo saves/restores editing metadata in ~/.viminfo.
" '100   Save marks for the last 100 edited files
" f1     Store global marks
" <500   Save max of 500 lines of each register
" :100   Save 100 lines of command-line history
" /100   Save 100 searches
" h      Disable hlsearch when starting
set viminfo='100,f1,<500,:100,/100,h

" ---------- Mappings ----------
inoremap <F5> <esc>:put =strftime('%Y-%m-%d')<CR>i

" Use space as leader
nnoremap <SPACE> <Nop>
let mapleader = " "

nnoremap <leader>pf :FZF<CR>
nnoremap <leader>pg :Ag<space>
nnoremap <leader>pe :Ex<CR>
nnoremap <leader>pr :Rex<CR>
nnoremap <leader>u :UndotreeToggle<CR>

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

" More convenient autocomplete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <tab><tab> <C-X><C-o>

" ALE
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>
nnoremap K :ALEHover<CR>
nnoremap <leader>aj :ALENext<CR>
nnoremap <leader>ak :ALEPrevios<CR>
nnoremap <leader>ar :ALERename<CR>
nnoremap <leader>ac :ALECodeAction<CR>
vnoremap <leader>ac :ALECodeAction<CR>

" -- ALE --
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
let g:ale_linters = {
                  \ 'go': ['gopls'],
                  \ 'python': ['pylsp'],
                  \ 'sh': ['shellcheck'],
                  \ }
let g:ale_fixers = {
                  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
                  \ 'python': ['black', 'isort'],
                  \ 'javascript': ['prettier', 'eslint'],
                  \ 'typescript': ['prettier', 'eslint'],
                  \ 'css': ['prettier'],
                  \ 'json': ['prettier'],
                  \ 'sh': ['shfmt'],
                  \ }
" -- Go --
let g:go_highlight_format_strings = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1

augroup go
  autocmd!
  autocmd FileType go setlocal nolist
  autocmd FileType go setlocal tabstop=2
  autocmd FileType go setlocal softtabstop=2
  autocmd FileType go setlocal shiftwidth=2
augroup END

" -- Clojure --
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
augroup END

" -- Java --
let java_comment_strings=1
let java_highlight_functions=1
let java_highlight_java_lang_ids=1

augroup java
  autocmd!
  autocmd FileType java set cino:=(0
augroup END

" -- JavaScript --
augroup javascript
  autocmd!
  autocmd FileType javascript setlocal tabstop=2
  autocmd FileType javascript setlocal softtabstop=2
  autocmd FileType javascript setlocal shiftwidth=2
augroup END

let g:vim_jsx_pretty_colorful_config = 1


" ----------- Misc -------------

" Prints the active syntax highlighting group and color under cursor
function! SynGroup()
let l:s = synID(line('.'), col('.'), 1)
echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>
