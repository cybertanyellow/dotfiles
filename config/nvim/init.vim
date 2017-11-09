call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', {'tag': '*'}
Plug 'nsf/gocode', {'tag': 'v.20150303', 'rtp': 'vim'}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
Plug 'junegunn/fzf.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'NLKNguyen/c-syntax.vim'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'mileszs/ack.vim'
Plug 'chazy/cscope_maps'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'benmills/vimux'
Plug 'majutsushi/tagbar'
Plug 'dkprice/vim-easygrep'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
" Plug 'vim-syntastic/syntastic', {'dir': '~/source/syntastic'}

call plug#end()

" set number
set laststatus=2
" set t_Co=256
set background=dark
colorscheme PaperColor
let g:lightline = {'colorscheme': 'PaperColor'}

map <leader>f :FZF<cr>
" ripgrep + fzf-style
map <leader>g :Find

" if executable('ag')
""	let g:ackprg = 'ag --vimgrep'
"endif
" cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space>

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

set noautochdir
set hlsearch

" easygrep
let g:EasyGrepFilesToExclude=".svn,.git,tags,cscope.*"

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" w0rp/ale
let g:ale_statusline_format = ['... %d', '... %d', '']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ref: https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
set grepprg=rg\ --vimgrep
