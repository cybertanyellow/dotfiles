return {
	{ "neovim/nvim-lspconfig" },
	{ "j-hui/fidget.nvim" },
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			-- cmp Snippet completion
			"hrsh7th/cmp-vsnip",
			-- cmp Path completion
			"hrsh7th/cmp-path",
		},
		config = function()
			-- ...
		end,
	},
	{ "hrsh7th/vim-vsnip" },
	-- Adds extra functionality over rust analyzer
	--{ "simrat39/rust-tools.nvim" },
	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{ "nvim-lua/popup.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			"nvim-lua/plenary.nvim",
		}
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && \
		cmake --build build --config Release && \
		cmake --install build --prefix build"
	},
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		-- event = { "LazyFile", "VeryLazy" },
		event = { "VeryLazy" },
		init = function(plugin)
			-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
			-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
			-- no longer trigger the **nvim-treeitter** module to be loaded in time.
			-- Luckily, the only thins that those plugins need are the custom queries, which we make available
			-- during startup.
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				config = function()
					-- When in diff mode, we want to use the default
					-- vim text objects c & C instead of the treesitter ones.
					local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
					local configs = require("nvim-treesitter.configs")
					for name, fn in pairs(move) do
						if name:find("goto") == 1 then
							move[name] = function(q, ...)
								if vim.wo.diff then
									local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
									for key, query in pairs(config or {}) do
										if q == query and key:find("[%]%[][cC]") then
											vim.cmd("normal! " .. key)
											return
										end
									end
								end
								return fn(q, ...)
							end
						end
					end
				end,
			},
		},
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection", mode = "x" },
		},
		---@type TSConfig
		---@diagnostic disable-next-line: missing-fields
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"bitbake",
				"c",
				"diff",
				"json",
				"make",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"rust",
				"toml",
				"xml",
				"yaml",
				"yang",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				move = {
					enable = true,
					goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
					goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
					goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
					goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
				},
			},
		},
		---@param opts TSConfig
		config = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				---@type table<string, boolean>
				local added = {}
				opts.ensure_installed = vim.tbl_filter(function(lang)
					if added[lang] then
						return false
					end
					added[lang] = true
					return true
				end, opts.ensure_installed)
			end
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{ "tpope/vim-fugitive" },
	-- Some color scheme other then default
	{ "arcticicestudio/nord-vim" },
	-- { "NLKNguyen/papercolor-theme" },
	-- { "itchyny/lightline.vim", colorscheme = "PaperColor"})
	{ "folke/tokyonight.nvim" },
	{ "olimorris/onedarkpro.nvim" },
	-- "sainnhe/everforest",
	{ "rebelot/kanagawa.nvim" },
	-- "sainnhe/gruvbox-material",
	{ "marko-cerovac/material.nvim" },

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			lazy = true
		},
	},
	{ "alexghergh/nvim-tmux-navigation" },
	-- { "vivien/vim-linux-coding-style" },
	{ "Vimjas/vim-python-pep8-indent" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = { 
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			lazy = true
		}
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		--tag = "v2.20.8",
	},
	{ "lewis6991/gitsigns.nvim" },
	{ "kepano/flexoki-neovim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		'SuperBo/fugit2.nvim',
		opts = {
			width = 70,
		},
		dependencies = {
			'MunifTanjim/nui.nvim',
			'nvim-tree/nvim-web-devicons',
			'nvim-lua/plenary.nvim',
			{
				'chrisgrieser/nvim-tinygit', -- optional: for Github PR view
				dependencies = { 'stevearc/dressing.nvim' }
			},
		},
		cmd = { 'Fugit2', 'Fugit2Graph' },
		keys = {
			{ '<leader>g', mode = 'n', '<cmd>Fugit2Graph<cr>' }
		}
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	},
	{ "p00f/clangd_extensions.nvim" },
--	{
--		"OXY2DEV/markview.nvim",
--
--		dependencies = {
--			-- You may not need this if you don't lazy load
--			-- Or if the parsers are in your $RUNTIMEPATH
--			"nvim-treesitter/nvim-treesitter",
--
--			"nvim-tree/nvim-web-devicons"
--		},
--	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},
	{
		"mistricky/codesnap.nvim",
		build = "make build_generator",
		keys = {
			{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
			{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
		},
		opts = {
			save_path = "~/Pictures",
			has_breadcrumbs = true,
			bg_theme = "bamboo",
		},
	},
	{
		"aaronik/treewalker.nvim",
		opts = {
			highlight = true -- default is false
		}
	},
}
