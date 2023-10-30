local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		yaml = { "prettier" },
		json = { "prettier" },

		lua = { "stylua" },

		python = { "isort", "black" },

		markdown = { "markdownlint" },

		bash = { "beautysh" },

		ocaml = { "ocamlformat" },

		rust = { "rustfmt" },

		java = { "google-java-format" },

		cpp = { "clang-format" },

		c = { "clang-format" },

		go = { "gofmt" },
	},
})

vim.keymap.set({ "n", "v" }, "<leader>f", conform.format)
