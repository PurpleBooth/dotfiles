set termguicolors
set background=dark

if !isdirectory($XDG_DATA_HOME . "/vim/swap")
  call mkdir($XDG_DATA_HOME . "/vim/swap", "p")
endif

set directory=$XDG_DATA_HOME/vim/swap

if !isdirectory($XDG_DATA_HOME . "/vim/undo")
  call mkdir($XDG_DATA_HOME . "/vim/undo", "p")
endif

set undodir=$XDG_DATA_HOME/vim/undo

if !isdirectory($XDG_DATA_HOME . "/vim/backup")
  call mkdir($XDG_DATA_HOME . "/vim/backup", "p")
endif

set backupdir=$XDG_DATA_HOME/vim/backup

set viminfo+='1000,n$XDG_DATA_HOME/nvim/viminfo

if !isdirectory($XDG_DATA_HOME . "/nvim/after")
  call mkdir($XDG_DATA_HOME . "/nvim/after", "p")
endif

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set spelllang=en_gb,de_de
set mouse=a
set clipboard=unnamed
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'dag/vim-fish'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-sensible'
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

syntax on
colorscheme "dracula"
