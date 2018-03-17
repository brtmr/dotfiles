
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ScrollColors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set nu
set colorcolumn=80
set cursorline
set background=dark
colorscheme molokai
syn on
set showcmd

" space as leader
let mapleader = "\<Space>"

map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>

set expandtab
set shiftwidth=4
set tabstop=4

set backspace=indent,eol,start

" so that ycm always uses the python from the current virtualenv
let g:ycm_python_binary_path = 'python'

" airline configuration
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="luna"

set mouse=a
set incsearch
set hlsearch

" ========= [no trailing whitespace in python and javascript] ===============
function! TrimWhiteSpace()
    %s/\s*$//e
    ''
endfunction
autocmd BufWritePre *.js call TrimWhiteSpace()
autocmd BufWritePre *.py call TrimWhiteSpace()

" so that the preview window for YCM opens at the bottom,
" and with a fixed size.
set splitbelow
" ugly workaroung to set a previewheight greater than 3:
" when entering a new buffer, check whether this is a preview buffer and if
" so, set its size to previewheight.
set previewheight=10
au BufEnter ?* call PreviewHeightWorkAround()
function! PreviewHeightWorkAround()
    if &previewwindow
        exec 'setlocal winheight='.&previewheight
    endif
endfunc
nnoremap <F2>   :YcmCompleter GetDoc<CR>

" ========= [ swap and backup files in a central location ] ==================
" this prevents vim from cluttering up my projects folder.
set directory=$HOME/.vim/swapfiles//
set backupdir=$HOME/.vim/backups//


nnoremap <F3> :TagbarOpenAutoClose<CR>
