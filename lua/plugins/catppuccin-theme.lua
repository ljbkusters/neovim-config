return {
  "catppuccin/nvim",
   name = "catppuccin",
   priority = 1000,
   config = function ()
     vim.cmd([[
       colorscheme catppuccin
     ]])
    vim.api.nvim_create_user_command("DarkTheme", function() vim.cmd.colorscheme("catppuccin-mocha") end, {})
    vim.api.nvim_create_user_command("LightTheme", function() vim.cmd.colorscheme("catppuccin-latte") end, {})

   end,
}
