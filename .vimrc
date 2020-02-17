set nocompatible
set langmenu=en_GB
set encoding=utf-8

" Plugins {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'caksoylar/vim-mysticaltutor'
Plugin 'lervag/vimtex'


call vundle#end()            " required

" }}}

" Sort needed {{{

" Use Vim settings, rather than Vi settings. 
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" }}}

" Colors {{{

syntax enable
filetype plugin on
set termguicolors
colorscheme mysticaltutor
hi Normal ctermbg=none
hi Terminal ctermbg=none
"hi Terminal guibg=none
"hi Normal guibg=none

autocmd BufNewFile,BufRead *.json.template set syntax=json

let asmsyntax="masm"

" }}}

" UI {{{

let mapleader=","
set number
set relativenumber
set modelines=1
set showcmd					" display incomplete commands
set cursorline
set showmatch

if has("gui_running")
  if has("gui_win32")
    set guifont=ProFont_for_Powerline:h12
  endif
endif

" }}}

" Tabs And Spaces {{{

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" }}}

" Airline {{{

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

" }}}

" Ctrl-P {{{

let g:ctrlp_working_path_mode = 'r'

nmap <leader>p :CtrlP<cr>

nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" }}}

" Buffers {{{

nmap <leader>jj :BuffergatorMruCyclePrev<cr>
nmap <leader>kk :BuffergatorMruCycleNext<cr>

nmap <leader>bl :BuffergatorOpen<cr>

nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

let g:buffergator_viewport_split_policy = 'R'
let g:buffergator_suppress_keymaps = 1
" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" }}}

" File Find {{{

set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set hidden


" }}}

" Section Folding {{{

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
nnoremap <space> za

" }}}

" VIMRC {{{

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC <bar> :doautocmd BufRead<CR>

" }}}

" vim:foldmethod=marker:foldlevel=0
