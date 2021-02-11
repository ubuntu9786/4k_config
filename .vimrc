set number


call plug#begin('~/.vim/plugged')


Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-latex/vim-latex' 




call plug#end()
set paste
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
colo OceanicNext 
set background=dark
set ignorecase



