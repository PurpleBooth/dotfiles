set mouse=a
set clipboard=unnamed
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $HOME/.vimrc
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
