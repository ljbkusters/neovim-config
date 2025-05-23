-- A git wrapper plugin for vim
return {
  "tpope/vim-fugitive",
  opts = {
    vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
    vim.keymap.set("n", "<leader>ga", ":Git add %<CR>")
  }
}
