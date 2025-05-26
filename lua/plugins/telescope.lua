return {
  "nvim-telescope/telescope.nvim",
  tag='0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim' 
  },
  config = function()
    local builtin = require('telescope.builtin')
    local nmap = function(key, method, opts)
      opts = opts or {}
      vim.keymap.set('n', key, method, opts)
    end
    -- find files
    nmap('<leader>ff', builtin.find_files)
    -- find git
    nmap('<leader>fg', builtin.git_files)
    -- find search (grep)
    nmap('<leader>fs', builtin.live_grep)
  end
}
