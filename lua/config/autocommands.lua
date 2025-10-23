-- Speed mode for very long lines / large files
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local max_line_length = 5000

    -- find the longest line
    local longest_line = 0
    for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
      if #line > max_line_length then
        longest_line = #line
      end
    end


    if longest_line > max_line_length then
      vim.opt_local.foldtext = [[
        v:lua.require('foldtext').fold_text()
      ]]
      vim.opt_local.fillchars = vim.opt_local.fillchars + { fold = " "}

      _G.foldtext = {}

      function _G.foldtext.fold_text()
        local line_count = vim.v.foldend - vim.v.foldstart + 1
        return string.format("... %d lines folded ...", line_count)
      end

      vim.cmd("syntax off")       -- disable syntax highlighting
      vim.opt_local.foldmethod = "manual"
      vim.cmd("normal! zfG") -- fold everything

      vim.opt_local.foldcolumn = "0"

      vim.opt_local.wrap = false  -- disable line wrap
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
      vim.opt_local.relativenumber = false
      vim.opt_local.number = false
      vim.opt_local.lazyredraw = true
      vim.opt_local.spell = false

      -- Critical for command/search speed
      vim.opt.cmdheight = 0            -- Hide cmdline unless used
      vim.opt.showcmd = false          -- Don't show incomplete commands
      vim.opt.wildmenu = false         -- Don't render completion menu
      vim.opt.wildoptions = {}         -- Disable fancy popup completion

      -- Optional: disable search highlighting
      vim.opt.hlsearch = false

      print("Long-line file detected: Long line folded to prevent redraw lag. Some default settings have been disabled.")
    end
  end,
})
