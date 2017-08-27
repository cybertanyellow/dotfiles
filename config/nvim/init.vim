call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', {'tag': '*'}
Plug 'nsf/gocode', {'tag': 'v.20150303', 'rtp': 'vim'}
Plug 'junegunn/fzf', {'dir': '~/gopath/src/github.com/junegunn/fzf', 'do': './install -all'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'NLKNguyen/c-syntax.vim'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'

call plug#end()

set number
set laststatus=2
set t_Co=256
set background=dark
colorscheme PaperColor
let g:lightline = {'colorscheme': 'PaperColor'}

map <leader>f :FZF<cr>
