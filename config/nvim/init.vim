" Format inspired by Todd Yamakawa
"
"
" ==============
"    VIM-PLUG
" ==============


" --- Auto Install, taken from vim-plug page

"if empty(glob('~/.config/nvim/plugged'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif




" --- Setup ---
set nocompatible
filetype off



" --- Vim Plugins ---
call plug#begin('~/.vim/vim-plug')
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }    "Filesystem navigator
    Plug 'mhinz/vim-startify'                       "Fancy vim startup
    Plug 'airblade/vim-gitgutter'                   "Shows diffs between previous commit in sidebar
    "Plug 'w0rp/ale'                                 "Style checker, trying over syntastic...
    Plug 'antoinemadec/vim-verilog-instance'        "For instatiating modules real quick in systemverilog
    Plug 'vhda/verilog_systemverilog.vim'           "Verilog syntax
    Plug 'junegunn/limelight.vim'                   "Highlights current text
    Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocomplete engine, basically.
    Plug 'tpope/vim-fugitive'
    Plug 'vimwiki/vimwiki'                          "Diary plugin
    Plug 'powerman/vim-plugin-AnsiEsc'
    Plug 'terryma/vim-multiple-cursors'             "multiple cursors
    Plug 'junegunn/fzf'                             "Fuzzy finder for vim
    Plug 'vim-airline/vim-airline'                  "Status line, but better
    Plug 'vim-airline/vim-airline-themes'           "themes for above
    Plug 'octol/vim-cpp-enhanced-highlight'         "CPP highlight but better
    Plug 'morhetz/gruvbox'                          "Pretty colors


" --- Plugins on trial ---
    Plug 'Shougo/denite.nvim'                       "Nice mappings
    Plug 'tpope/vim-surround'                       "shortcuts for surrounding strings and such
    Plug 'easymotion/vim-easymotion'                "Easier ... motion
    Plug 'jacoborus/tender.vim'                     "other colours
    Plug 'altercation/vim-colors-solarized'         "more colours
    Plug 'devjoe/vim-codequery'
    Plug 'mileszs/ack.vim'
    Plug 'Shougo/unite.vim'








call plug#end()


map <C-n> :NERDTreeToggle<CR>
map <C-f> :FZF $ROOT<CR>
map <C-b> :vsp<CR> :silent! Startify<CR>
map <C-A> :silent! AnsiEsc<CR>
map cq :CodeQuery<CR>
let g:airline#extensions#tabline#enabled = 1


" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction






" --- Enable Plugins ---
filetype indent plugin on




" ======================
"    GENERAL SETTINGS
" ======================
set history=50     " Save 50 command lines of history
set laststatus=2   " Always display status line

" --- Set <Leader> to Space ---
let mapleader="\<space>"
let g:mapleader="\<space>"


"nnoremap <Enter> :





















" ====================
"    BEAUTIFICATION
" ====================
runtime ~/.config/nvim                  " Pointer to .vim directory
syntax on                       " Enable syntax highlighting
set encoding=utf-8              " Set Vim character encoding to UTF-8
set termencoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8            " Specify script character encoding to UTF-8
set guifont=consolas            " Favorite font
set termguicolors
silent! colorscheme gruvbox" Best color


" --- Display Settings ---
set number                      " Show numberlines
set showcmd
set showmatch
set incsearch                   " Incremental search
set ruler



" --- Indentation Settings ---
set tabstop=2                   "Tabs as 2 columns
set expandtab                   "Always spaces, never tabs
set autoindent                  "Autoindent
set shiftwidth=2
set smarttab
set softtabstop=2
"




" --- Indentation Shortcuts ---
" Press <Tab> in visual mode to indent
vnoremap <Tab> >gv
" Press <Shift-Tab> in visual mode to unindent
vnoremap <S-Tab> <gv
" <Tab> in normal mode to indent



" --- autocmd Group for All Files ---
augroup Generic


	" Highlight trailing whitespace
	autocmd BufRead * 2match SpellBad /\v\s+$/


	" Automatically remove trailing whitespace
	"autocmd BufWritePre * %s/\s\+$//e

	" Automatically add +x permissions
	autocmd BufWritePost * if getline(1) =~ "^#!.*/bin/" | silent execute "!chmod +x %" | endif

    " Automatically regen ctags on each buffer write
    " TODO: DISABLE THIS! This was just a little fun idea
    "autocmd BufWritePost * silent !udc
	" Disable syntax for large files
	"autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif

augroup END




" ==============
"    MOVEMENT
" ==============
imap kj <Esc>
imap jk <Esc>
noremap # ^
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h
set hidden




" =======================
"    GENERAL SHORTCUTS
" =======================

"Backspace anything
set backspace=indent,eol,start

" --- Save/Quit Shortcuts ---
nnoremap <Leader>w :w!<Enter>
nnoremap <Leader>q :q!<Enter>
nnoremap <Leader>x :x!<Enter>
nnoremap <Leader>z :x!<Enter>
nnoremap <Leader>d :bd!<Enter>
nnoremap <Leader>n :bn<Enter>
nnoremap <Leader>m :bp<Enter>
"Paste from system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
autocmd Filetype python nnoremap <buffer> <Leader>r :term python %<CR>
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
