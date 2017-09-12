call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', {'tag': '*'}
Plug 'nsf/gocode', {'tag': 'v.20150303', 'rtp': 'vim'}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
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
Plug 'chazy/cscope_maps'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'benmills/vimux'
Plug 'majutsushi/tagbar'

call plug#end()

" set number
set laststatus=2
" set t_Co=256
set background=dark
colorscheme PaperColor
let g:lightline = {'colorscheme': 'PaperColor'}

map <leader>f :FZF<cr>

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>

" Togle run tagbar
map <F8> :TagbarToggle<CR>
