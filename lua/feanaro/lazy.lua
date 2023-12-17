local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	{ "catppuccin/nvim", name = "catppuccin" },

	{
		"nvim-treesitter/nvim-treesitter",

		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	"nvim-treesitter/playground",
	"theprimeagen/harpoon",
	"mbbill/undotree",
	"tpope/vim-fugitive",

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},

	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = false,
			})
		end,
	},

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = true,
					markdown = true,
					help = false,
					gitcommit = true,
					gitrebase = true,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
			})
		end,
	},

	"ThePrimeagen/vim-be-good",
	"eandrju/cellular-automaton.nvim",

	"christoomey/vim-tmux-navigator", -- tmux & split window navigation

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

	"norcalli/nvim-colorizer.lua", -- colorize hex codes, etc...

	-- Add context at the top of the buffer
	"nvim-treesitter/nvim-treesitter-context",

	-- Telescope plugins
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	{ "AckslD/nvim-neoclip.lua", dependencies = { "nvim-telescope/telescope.nvim" } },

	{ "nvim-telescope/telescope-ui-select.nvim" },

	{
		"aaronhallaert/advanced-git-search.nvim",
		config = function()
			require("telescope").load_extension("advanced_git_search")
		end,
	},

	{ "nvim-telescope/telescope-live-grep-args.nvim" },

	{ "stevearc/conform.nvim", event = { "BufRead", "BufNewFile" } },

	{ "mfussenegger/nvim-lint", event = { "BufReadPre", "BufNewFile" } },

	{ "folke/which-key.nvim" },

	-- Coq
	{ "whonore/Coqtail" },
	{ "tomtomjhj/coq-lsp.nvim" },

	{
		"lervag/vimtex",
		ft = {
			"tex",
		},
	},
}

require("lazy").setup(plugins, {})
