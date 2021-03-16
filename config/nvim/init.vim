call plug#begin('~/.vim/plugged')

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'

call plug#end()

syntax enable
filetype plugin indent on

set completeopt=menuone,noinsert,noselect
set shortmess+=c
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
require'completion'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		signs = true,
		update_in_insert = true,
	}
)
EOF

set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
let g:rg_derive_root='true'
nnoremap \ :Rg<CR>
nnoremap <C-T> :Files<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>s :BLines<cr>
nmap <F8> :TagbarToggle<CR>
colorscheme PaperColor
let g:lightline = {'colorscheme': 'PaperColor'}
nnoremap <silent> vv <C-w>v
" set noautochdir
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
