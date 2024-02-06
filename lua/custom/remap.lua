vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete to void and paste. (In Visual Block)
vim.keymap.set("x", "<leader>p", '"_dP')

-- System copy paste
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>sp", '"+p')
vim.keymap.set("n", "<leader>sP", '"+P')

-- Visual Move by Primeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Overide Ctrl-c with Esc
vim.keymap.set({ "n", "i", "v", "c" }, "<C-c>", "<Esc>")
