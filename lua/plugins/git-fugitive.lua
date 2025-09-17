-- A git wrapper plugin for vim
return {
  "tpope/vim-fugitive",
  config = function()
  vim.keymap.set("n", "<leader>gc", function()
      -- open diff view in new tab
      vim.cmd("tab Git diff --staged")
      local diff_buffer_id = vim.api.nvim_get_current_buf()
      -- open commit view in a split
      vim.cmd("Git commit")
      local commit_buffer_id = vim.api.nvim_get_current_buf()

      -- if the screen is wider than it is tall
      -- 1. focus back on the diff buffer
      -- 2. move the diff buffer to the right
      -- 3. focus back on the commit buffer
      local columns = vim.o.columns
      if(columns > 100) then
        vim.cmd("wincmd p")
        vim.cmd("wincmd L")
        vim.cmd("wincmd p")
      end

      -- set up autocmd to close diff when commit buffer is closed
      vim.api.nvim_create_autocmd("BufWipeout", {
        group = vim.api.nvim_create_augroup("GitCommitDiffCleanup", { clear = true }),
        buffer = commit_buffer_id,
        callback = function()
          -- close the diff buffer if it exists
          if vim.api.nvim_buf_is_valid(diff_buffer_id) then
            vim.api.nvim_buf_delete(diff_buffer_id, { force = true })
          end
        end,
      })
    end, { desc = "Git commit with staged diff split (adaptive + autoclose)" })
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
