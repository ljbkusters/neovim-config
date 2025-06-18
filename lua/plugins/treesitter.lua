return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.3",
  lazy = false,
  opts = {
    ensure_installed = {
      "python",
      "markdown",
      "lua",
      "vim",
      "vimdoc",
    },
    highlight = {
      enable = true,
    },
  },
}
