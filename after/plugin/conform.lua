local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		yaml = { "prettierd" },
		json = { "prettierd" },

		lua = { "stylua" },

		python = { "isort", "black" },

		markdown = { "markdownlint" },

		bash = { "beautysh" },

		ocaml = { "ocamlformat" },

		cpp = { "clang_format" },

		c = { "clang_format" },

		go = { "gofmt" },

		tex = { "latexindent" },
	},
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	if conform.format() then
	else
		vim.lsp.buf.format()
	end
end)
