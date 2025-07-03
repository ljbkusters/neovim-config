return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.3",
  lazy = false,
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        "python",
        "markdown",
        "lua",
        "vim",
        "vimdoc",
      },
      ignore_install = {},
      modules = {},
      auto_install = false,
      sync_install = false,
      highlight = {
        enable = true,
      },
    })
    require('nvim-treesitter').setup()
  end
}
