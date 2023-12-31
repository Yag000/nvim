vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<leader>gc", function()
	vim.cmd.Git("commit")
end)

vim.keymap.set("n", "<leader>gp", function()
	vim.cmd.Git("push")
end)

vim.keymap.set("n", "<leader>gl", function()
	vim.cmd.Git("pull")
end)

vim.keymap.set("n", "<leader>gbl", function()
	vim.cmd.Git("blame")
end)

vim.keymap.set("n", "<leader>gd", function()
	vim.cmd.Gdiffsplit()
end)

vim.keymap.set("n", "<leader>go", ":Git push -u origin ", opts)

vim.keymap.set("n", "<leader>gbs", ":Git switch ", opts)
vim.keymap.set("n", "<leader>gbc", ":Git checkout -b ", opts)

vim.keymap.set("n", "<leader>gf", function()
	vim.cmd.Git("fetch")
end)

vim.keymap.set("n", "<leader>grh", ":Git rebase -i HEAD~", opts)

vim.keymap.set("n", "<leader>gmt", function()
	vim.cmd.Git("mergetool")
end)
