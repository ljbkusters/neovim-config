-- A plugin that automatically closes brackets, quotes, and braces
-- https://github.com/m4xshen/autoclose.nvim
return {
  "m4xshen/autoclose.nvim",
  config = function() require("autoclose").setup({}) end,
}
