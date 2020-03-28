set undodir=$XDG_DATA_HOME/vim/undo
set directory=$XDG_DATA_HOME/vim/swap
set backupdir=$XDG_DATA_HOME/vim/backup
set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after

set mouse=a
set clipboard=unnamed
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

if empty(glob('$HOME/.config/vim/autoload/plug.vim'))
  let s:downloadurl = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let s:destinedirectory = $HOME . "/.config/vim/autoload/"
  let s:destinefile = s:destinedirectory . "plug.vim"

  if !isdirectory(s:destinedirectory)
    call mkdir(s:destinedirectory, "p")
  endif

  silent execute '!curl --output ' . s:destinefile .
      \ ' --create-dirs --location --fail --silent ' . s:downloadurl

  autocmd VimEnter * PlugInstall --sync | source "$HOME/config/vim/.vimrc"
endif

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-sensible'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

syntax on
colorscheme dracula
