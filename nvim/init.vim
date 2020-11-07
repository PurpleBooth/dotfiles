set termguicolors

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

set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/nvim/after

if empty(glob($HOME . '/.config/nvim/autoload/plug.vim'))
  let s:downloadurl = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let s:destination_directory = $HOME . "/.config/nvim/autoload/"
  let s:destination_file = s:destination_directory . "plug.vim"

  if !isdirectory(s:destination_directory)
    call mkdir(s:destination_directory, "p")
  endif

  silent execute '! curl --output ' . s:destination_file .
      \ ' --create-dirs --location --fail --silent ' . s:downloadurl

  autocmd VimEnter * PlugInstall --sync | source $HOME . "/.config/nvim/.vimrc"
endif

set mouse=a
set clipboard=unnamed
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

call plug#begin()
Plug 'dag/vim-fish'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-sensible'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
call plug#end()

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

syntax on
colorscheme dracula
