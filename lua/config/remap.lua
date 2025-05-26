-- VIM REMAPS
--
-- Note that this file must be loaded BEFORE lazy!
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- ease of life
vim.keymap.set("n", "J", "mzJ`z") -- J but cursor stays in place
vim.keymap.set("n", "n", "nzzzv") -- search n but cursor stays in place
vim.keymap.set("n", "N", "Nzzzv") -- search N but cursor stays in place
