
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    filters = {
      dotfiles = true,
    },
    renderer = {
      group_empty = true,
      icons = {
        glyphs = {
          git = {
            -- unstaged = "✗",
            -- staged = "✓",
            -- unmerged = "",
            -- renamed = "➜",
            -- untracked = "★",
            -- deleted = "",
            -- ignored = "◌",
          },
        },
      },
    },
    -- on_attach = function() end,
    vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>"),
  },
}
