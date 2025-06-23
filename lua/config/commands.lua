-- user commands

vim.api.nvim_create_user_command('W', function() vim.cmd('w') end, {})
vim.api.nvim_create_user_command("WQ", function() vim.cmd("wq") end, { bang = true })
vim.api.nvim_create_user_command("Wq", function() vim.cmd("wq") end, { bang = true })


-- runs every time a terminal is opened
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', {clear = true}),
  callback = function()
    -- disable line numbering
    vim.opt.number = false
    vim.opt.relativenumber = false
    -- source bashrc in terminal
    local job_id = vim.bo.channel
    vim.fn.chansend(job_id, {"source ~/.config/bash/.bashrc\r\nclear \r\n"})
  end,
})

-- open a small terminal below
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew() -- create new v split
  vim.cmd.term() -- open terminal
  vim.cmd.wincmd("J") -- put at bottom of screen
  vim.api.nvim_win_set_height(0, 8) -- set hight
end)
