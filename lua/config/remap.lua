vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- go to file tree

-- ease of life
vim.keymap.set("n", "J", "mzJ`z") -- J but cursor stays in place
vim.keymap.set("n", "n", "nzzzv") -- search n but cursor stays in place
vim.keymap.set("n", "N", "Nzzzv") -- search N but cursor stays in place
