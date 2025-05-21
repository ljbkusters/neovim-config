-- use system clipboard
-- relative line numbering
vim.opt.nu = true
vim.opt.relativenumber = true

-- copy and paste to/from system clipboard
vim.cmd("set clipboard+=unnamedplus")

-- spaces and tabs, indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop=2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

-- swp files
vim.opt.swapfile=false
vim.opt.backup=false

-- undo
vim.opt.undodir=os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile=true

vim.opt.hlsearch = false
vim.opt.incsearch = true 

-- seems to have no difference here..
vim.opt.termguicolors = true

-- leave some space at the bottom when scrolling down
vim.opt.scrolloff = 8

-- vim.opt.signcolumn = "yes" -- idk what this does
-- vim.opt.ifname:append("@-@") -- idk what this does

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
