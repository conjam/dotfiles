" Format inspired by former mentor Todd Yamakawa
"
"
" ==============
"    VIM-PLUG
" ==============


" --- Auto Install, taken from vim-plug page 

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" --- Setup ---
set nocompatible
filetype off



" --- Vim Plugins ---
call plug#begin('~/.vim/vim-plug')
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }    "Filesystem navigator
    Plug 'mhinz/vim-startify'   "Fancy vim startup
    Plug 'airblade/gitgutter'   "Shows diffs between previous commit in sidebar
    Plug 'w0rp/ale'             "Style checker, trying over syntastic...
    Plug 'tpope/vim-fugitive'   "Git wrapper for Vim
    Plug 'liuchengxu/vista'     "Ctag + LSP searcher, not sure if I'll keep it
    Plug 'antoinemadec/vim-verilog-instance' "For instatiating modules real quick in systemverilog
    Plug 'vhda/verilog_systemverilog.vim' "Verilog syntax
call plug#end()


map <C-n> :NERDTreeToggle<CR>

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


nnoremap <Enter> :





















" ====================
"    BEAUTIFICATION
" ====================
runtime ~/.vim                  " Pointer to .vim directory
syntax on                       " Enable syntax highlighting
set t_Co=256                    " Terminal supports 256 colors
set encoding=utf-8              " Set Vim character encoding to UTF-8
set termencoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8            " Specify script character encoding to UTF-8
set guifont=consolas            " Favorite font
silent! colorscheme badwolf     " Best color


" --- Display Settings ---
set number                      " Show numberlines
set showcmd
set showmatch
set incsearch                   " Incremental search 
set ruler 



" --- Indentation Settings ---
set tabstop=4                   "Tabs as 4 columns
set expandtab                   "Always spaces, never tabs
set autoindent                  "Autoindent
"set softtabstop=4




" --- Indentation Shortcuts ---
" Press <Tab> in visual mode to indent
vnoremap <Tab> >gv
" Press <Shift-Tab> in visual mode to unindent
vnoremap <S-Tab> <gv
" <Tab> in normal mode to indent
nnoremap <Tab> :call TabQuickFix('next')<Enter>
" <Shift-Tab> in normal mode to unindent
nnoremap <S-Tab> :call TabQuickFix('prev')<Enter>


" --- autocmd Group for All Files ---
augroup Generic


	" Highlight trailing whitespace
	autocmd BufRead * 2match SpellBad /\v\s+$/	
	

	" Automatically remove trailing whitespace
	autocmd BufWritePre * %s/\s\+$//e

	" Automatically add +x permissions
	autocmd BufWritePost * if getline(1) =~ "^#!.*/bin/" | silent execute "!chmod +x %" | endif

	" Disable syntax for large files
	"autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif

augroup END




" ==============
"    MOVEMENT
" ==============
imap kj <Esc>
imap jk <Esc>
noremap # ^





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

