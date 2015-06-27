""""""""""""""""""""VUNDLE PLUGIN""""""""""""""""""""
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'walm/jshint.vim'
Plugin 'moll/vim-node'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'axiaoxin/vim-json-line-format'
Plugin 'axiaoxin/favorite-vim-colorscheme'
Plugin 'junegunn/vim-emoji'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'

call vundle#end()

filetype plugin indent on

set nobackup
set noswapfile

set encoding=utf-8
set fileencoding=chinese

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

language messages zh_CN.utf-8

set laststatus=2

syntax on
syntax enable

autocmd! bufwritepost .vimrc source %

set autoread

set hlsearch

set incsearch

set ignorecase

set guifont=Menlo:h14
set lines=40 columns=90

colorscheme Tomorrow-Night-Bright
"colorscheme elflord
"set background=dark

set showcmd

set showmatch

set autowrite

set mouse=a

set nu

set backspace=2

set smarttab


set autoindent
set smartindent

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/^$\n\+\%$//ge

set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

set fdm=indent
set foldlevel=99

"""""""""""""PLUGIN CONFIG""""""
let g:NERDSpaceDelims=1
let NERDTreeIgnore=['\.pyc$', '\~$']

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:ctrlp_show_hidden = 1

set completefunc=emoji#complete

let g:instant_markdown_slow = 1

"let g:airline_section_y = '%{strftime("%H:%M")}'

"let g:airline#extensions#tabline#enabled = 1

"let g:airline#extensions#tabline#left_sep = ' '

"let g:airline#extensions#tabline#left_alt_sep = '|'

"let g:airline#extensions#tabline#buffer_nr_show = 1

autocmd FileType python setlocal completeopt-=preview

let g:jedi#completions_command = "<C-n>"

let g:flake8_show_in_file = 1
let g:flake8_show_in_gutter = 1
autocmd! BufRead,BufWritePost *.py call Flake8()

let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwordTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

autocmd! BufRead,BufWritePost *.js :JSHint

""""""""""""""""""""""""KEY MAPPING"""""""""""

if exists("$VIRTUAL_ENV")
    autocmd BufRead,BufNewFile *.py noremap <F5> :!$VIRTUAL_ENV'/bin/python' %<CR>
else
    autocmd BufRead,BufNewFile *.py noremap <F5> :!python %<CR>
endif
