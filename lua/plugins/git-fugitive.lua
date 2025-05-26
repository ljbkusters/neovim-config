-- A git wrapper plugin for vim
return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
    vim.keymap.set("n", "<leader>ga", ":Git add %<CR>")
    vim.keymap.set("n", "<leader>gd", ":Git diff<CR>")
    vim.keymap.set("n", "<leader>gD", ":Git diff --staged<CR>")
    vim.keymap.set("n", "<leader>gs", ":Git status<CR>")
    vim.keymap.set("n", "<leader>gl", ":Git log --oneline<CR>")
    vim.keymap.set("n", "<leader>gL", ":Git log<CR>")
    -- git stash
    vim.keymap.set("n", "<leader>gSS", ":Git stash<CR>")
    vim.keymap.set("n", "<leader>gSP", ":Git stash pop<CR>")
  end
}
