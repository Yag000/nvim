local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettierd" },
		yaml = { "prettierd" },
		json = { "prettierd" },

		lua = { "stylua" },

		python = { "isort", "black" },

		markdown = { "markdownlint" },

		bash = { "beautysh" },

		ocaml = { "ocamlformat" },

		java = { "google-java-format" },

		cpp = { "clang_format" },

		c = { "clang_format" },

		go = { "gofmt" },
	},
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	if conform.format() then
	else
		vim.lsp.buf.format()
	end
end)
