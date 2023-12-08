local keymap = vim.keymap

-- Globals
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = { noremap = true, silent = true }

-- Pane & Window Navigation
keymap.set('n', '<C-h>', '<C-w>h', opts) -- Navigate Left
keymap.set('n', '<C-j>', '<C-w>j', opts) -- Navigate Down
keymap.set('n', '<C-k>', '<C-w>k', opts) -- Navigate Up
keymap.set('n', '<C-l>', '<C-w>l', opts) -- Navigate Right

-- split Management
keymap.set('n', '<leader>sv', '<cmd>vsplit<CR>', opts)
keymap.set('n', '<leader>sh', '<cmd>split<CR>', opts)

keymap.set('n', '<C-K>', '<cmd>resize -2<CR>', opts)
keymap.set('n', '<C-J>', '<cmd>resize +2<CR>', opts)
keymap.set('n', '<C-L>', '<cmd>vertical resize -2<CR>', opts)
keymap.set('n', '<C-H>', '<cmd>vertical resize +2<CR>', opts)
