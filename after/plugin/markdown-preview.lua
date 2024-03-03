vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	vim.cmd("MarkdownPreview")
end)
