--vim.opt.tabstop = 4
--vim.opt.shiftwidth = 4
--vim.opt.expandtab = true
--vim.bo.softtabstop = 4
-- maybe override by other language plugin

-- Check if the background color is dark or light
--local function is_background_dark()
  --return false
  --local bg_color = vim.api.nvim_get_hl_by_name('Normal', true).background
  -- Calculate the luminance of the background color
  --local b = bg_color & 0xff
  --local r = (bg_color >> 16) & 0xff
  --local g = (bg_color >> 8) & 0xff
  --local luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b
  -- Check if luminance is greater than a threshold to determine if background is dark or light
  --return luminance < 128
--end

-- vim.cmd("colorscheme kanagawa")
vim.cmd("colorscheme catppuccin")
require("lualine").setup({
  --{ theme = 'PaperColor' },
  -- { theme = 'tokyonight-night' },
  -- { theme = 'onedark' },
  -- { theme = 'everforest' },
  -- { theme = 'kanagawa' },
  { theme = 'catppuccin' },
  --{ theme = 'material' },
})

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

local function on_attach(client, buffer)
    local keymap_opts = { buffer = buffer }
    -- Code navigation and shortcuts
    vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keymap_opts)
    -- conflict with tmux-navigate. vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
    vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
    vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
    vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, keymap_opts)

    -- Show diagnostic popup on cursor hover
    local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
      end,
      group = diag_float_grp,
    })

    -- Goto previous/next diagnostic warning/error
    vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, keymap_opts)
    vim.keymap.set("n", "g]", vim.diagnostic.goto_next, keymap_opts)
end

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
--local opts = {
--  tools = {
--    runnables = {
--      use_telescope = true,
--    },
--    inlay_hints = {
--      auto = true,
--      show_parameter_hints = false,
--      parameter_hints_prefix = "",
--      other_hints_prefix = "",
--    },
--  },
--
--  -- all the opts to send to nvim-lspconfig
--  -- these override the defaults set by rust-tools.nvim
--  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
--  server = {
--    -- on_attach is a callback called when the language server attachs to the buffer
--    on_attach = on_attach,
--    settings = {
--      -- to enable rust-analyzer settings visit:
--      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
--      ["rust-analyzer"] = {
--        -- enable clippy on save
--        checkOnSave = {
--          command = "clippy",
--        },
--      },
--    },
--  },
--}
--require("rust-tools").setup(opts)

--require'lspconfig'.clangd.setup{}
--require("lspconfig").clangd.setup{}
--	on_attach = on_attach,
--}

-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
require('lspconfig').ruff.setup {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
}
require('lspconfig').zls.setup {}

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Add tab support
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  -- Installed sources
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "path" },
    { name = "buffer" },
  },
})

-- have a fixed column for the diagnostics to appear in
-- this removes the jitter when warnings/errors flow in
vim.wo.signcolumn = "yes"

-- " Set updatetime for CursorHold
-- " 300ms of no cursor movement to trigger CursorHold
-- set updatetime=300
vim.opt.updatetime = 100

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')
require('nvim-tmux-navigation').setup {
	disable_when_zoomed = true, -- defaults to false
	keybindings = {
		left = "<C-h>",
		down = "<C-j>",
		up = "<C-k>",
		right = "<C-l>",
		last_active = "<C-\\>",
		next = "<C-Space>",
	}
}

require('gitsigns').setup()
require('fidget').setup()

vim.o.termguicolors = true
--vim.cmd [[highlight IndentBlanklineIndent1 guibg=#252525 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { highlight = highlight, char = "" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
}

require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "rust", "python", "zig" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    --disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
}

-- TODO, below will crashed neovim
--require("noice").setup({
--	lsp = {
--		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--		override = {
--			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--			["vim.lsp.util.stylize_markdown"] = true,
--			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
--		},
--	},
--	-- you can enable a preset for easier configuration
--	presets = {
--		bottom_search = true, -- use a classic bottom cmdline for search
--		command_palette = true, -- position the cmdline and popupmenu together
--		long_message_to_split = true, -- long messages will be sent to a split
--		inc_rename = false, -- enables an input dialog for inc-rename.nvim
--		lsp_doc_border = false, -- add a border to hover docs and signature help
--	},
--})

local function cmd(command)
        return table.concat({ '<Cmd>', command, '<CR>' })
end

vim.keymap.set('n', 'vv', "<C-w>v", {})
vim.keymap.set('n', '<C-w>z', cmd 'WindowsMaximize')
vim.keymap.set('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
vim.keymap.set('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
vim.keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')

local tsb = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tsb.find_files, {})
vim.keymap.set('n', '<leader>fG', tsb.live_grep, {})
vim.keymap.set('n', '<leader>fg', tsb.grep_string, {})
vim.keymap.set('n', '<leader>fl', tsb.git_commits, {})
vim.keymap.set('n', '<leader>fb', tsb.buffers, {})
vim.keymap.set('n', '<leader>fh', tsb.help_tags, {})
vim.keymap.set('n', '<leader>fr', tsb.lsp_references, { noremap = true, silent = true})

local tw = require('treewalker')
vim.keymap.set('n', '<leader>tj', tw.move_down, { noremap = true })
vim.keymap.set('n', '<leader>tk', tw.move_up, { noremap = true })
vim.keymap.set('n', '<leader>th', tw.move_out, { noremap = true })
vim.keymap.set('n', '<leader>tl', tw.move_in, { noremap = true })

if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	vim.o.guifont = "Source Code Pro:h10"
end
