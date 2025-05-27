-- user commands
vim.api.nvim_create_user_command("W", vim.cmd.w, {})
vim.api.nvim_create_user_command("WQ", function() vim.cmd("wq") end, { bang = true })
vim.api.nvim_create_user_command("Wq", function() vim.cmd("wq") end, { bang = true })
