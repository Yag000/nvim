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

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

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

	-- Lean
	{
		"Julian/lean.nvim",
		event = { "BufReadPre *.lean", "BufNewFile *.lean" },

		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			-- you also will likely want nvim-cmp or some completion engine
		},

		-- see details below for full configuration options
		opts = {
			lsp = {
				on_attach = on_attach,
			},
			mappings = true,
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{ "wakatime/vim-wakatime", lazy = false },
}

require("lazy").setup(plugins, {})
