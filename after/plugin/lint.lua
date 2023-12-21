local lint = require("lint")

local commitlint = lint.linters.commitlint
commitlint.args = {
	"--config ~/Projects/templates/commitlint.config.js",
}

lint.linters_by_ft = {
	cpp = { "cpplint" },

	python = { "pylint" },

	gitcommit = { "commitlint" },

	sh = { "shellcheck" },

    tex = { "chktex" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", {
	clear = true,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end)
