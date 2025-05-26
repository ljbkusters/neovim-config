-- Adds `+`/`-`/`~` marks left of linenumbering in order to display git changes
return {
  "airblade/vim-gitgutter",
  config = function()
    vim.keymap.set("n", "<leader>ht", ":GitGutterLineHighlightsToggle<CR>")
  end
}
