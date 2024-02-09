require("util")
require("config")

vim.cmd.colorscheme("habamax")

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.updatetime = 50

vim.o.showmode = false
