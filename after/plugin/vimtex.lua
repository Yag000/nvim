vim.keymap.set({ "n", "v" }, "<leader>cc", function()
	vim.cmd("VimtexCompile")
end)
