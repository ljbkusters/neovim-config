-- A git wrapper plugin for vim
return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gc", "<cmd>tab Git commit<CR>")
    vim.keymap.set("n", "<leader>ga", "<cmd>Git add %<CR>")
    vim.keymap.set("n", "<leader>gd", "<cmd>tab Git diff<CR>")
    vim.keymap.set("n", "<leader>gD", "<cmd>tab Git diff --staged<CR>")
    vim.keymap.set("n", "<leader>gs", "<cmd>tab Git status<CR>")
    vim.keymap.set("n", "<leader>gl", "<cmd>tab Git log --oneline<CR>")
    vim.keymap.set("n", "<leader>gL", "<cmd>tab Git log<CR>")
    -- git stash
    vim.keymap.set("n", "<leader>gSS", "<cmd>Git stash<CR>")
    vim.keymap.set("n", "<leader>gSP", "<cmd>Git stash pop<CR>")

    local alias = require("config.command-aliases")
    alias.setup_alias("git", "Git")
  end
}
