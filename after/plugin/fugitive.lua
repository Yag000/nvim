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


vim.keymap.set("n", "<leader>gb", ":Git checkout -b ", opts)


vim.keymap.set("n", "<leader>gf", function() vim.cmf.Git("fetch") end)
