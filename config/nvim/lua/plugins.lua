return {
  "folke/tokyonight.nvim",
  "neovim/nvim-lspconfig",
  "j-hui/fidget.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  -- cmp Snippet completion
  "hrsh7th/cmp-vsnip",
  -- cmp Path completion
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  "hrsh7th/vim-vsnip",
  -- Adds extra functionality over rust analyzer
  "simrat39/rust-tools.nvim",
  "nvim-lua/popup.nvim",
  {
	  "nvim-telescope/telescope.nvim",
	  tag = "0.1.4",
	  dependencies = {
		  "nvim-lua/plenary.nvim",
	  }
  },
  {  "nvim-telescope/telescope-fzf-native.nvim",
     build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && \
     	cmake --build build --config Release && \
	cmake --install build --prefix build'
  },
  "nvim-treesitter/nvim-treesitter",
  "tpope/vim-fugitive",
  -- Some color scheme other then default
  "arcticicestudio/nord-vim",
  "NLKNguyen/papercolor-theme",
  -- {"itchyny/lightline.vim", colorscheme = 'PaperColor'})
  "folke/tokyonight.nvim",
  "olimorris/onedarkpro.nvim",
  "sainnhe/everforest",
  "rebelot/kanagawa.nvim",
  "sainnhe/gruvbox-material",
  "marko-cerovac/material.nvim",
  {
	  "nvim-lualine/lualine.nvim",
	  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
  },
  "alexghergh/nvim-tmux-navigation",
  "vivien/vim-linux-coding-style",
  "Vimjas/vim-python-pep8-indent",
  {
	  "nvim-neo-tree/neo-tree.nvim",
	  branch = "v2.x",
	  dependencies = { 
		  "nvim-lua/plenary.nvim",
		  "nvim-tree/nvim-web-devicons",
		  "MunifTanjim/nui.nvim",
	  }
  },
}
