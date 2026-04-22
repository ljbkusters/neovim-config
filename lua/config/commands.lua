-- user commands

vim.api.nvim_create_user_command('W', function() vim.cmd('w') end, {})
vim.api.nvim_create_user_command("WQ", function() vim.cmd("wq") end, { bang = true })
vim.api.nvim_create_user_command("Wq", function() vim.cmd("wq") end, { bang = true })


vim.api.nvim_create_user_command("T", function()
  vim.cmd("sp term://bash")
end, {})

vim.api.nvim_create_user_command("VT", function()
  vim.cmd("vsp term://bash")
end, {})

-- open a small terminal below
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew() -- create new v split
  vim.cmd.term() -- open terminal
  vim.cmd.wincmd("J") -- put at bottom of screen
  vim.api.nvim_win_set_height(0, 8) -- set hight
end)

local function edit_and_reload_config()
  -- 1. Get the path to the config file
  local config_file = vim.env.HOME .. '/.config/nvim/'

  -- 2. Open the config file in a new tab
  vim.cmd('tabedit ' .. config_file)

  -- 3. Change the current working directory (cwd) *for that specific buffer*
  local config_dir = vim.env.HOME .. '/.config/nvim'
  vim.cmd(' lcd ' .. config_dir)
end

-- Define the custom user command
vim.api.nvim_create_user_command('NvimEditConfig', edit_and_reload_config, {
  desc = 'Edit Neovim config in new tab and reload on close.',
  -- No options needed for this command
})
