-- VIM REMAPS
--
-- Note that this file must be loaded BEFORE lazy!
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- reload neovim config `source vimrc`
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>")

-- open mappings view
vim.keymap.set("n", "<leader>m", ":map<CR>")

-- ease of life
vim.keymap.set("n", "J", "mzJ`z") -- J but cursor stays in place
vim.keymap.set("n", "n", "nzzzv") -- search n but cursor stays in place
vim.keymap.set("n", "N", "Nzzzv") -- search N but cursor stays in place

