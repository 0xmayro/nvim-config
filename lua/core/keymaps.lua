local nmap = require('utils.keymap').nmap

-- Globals
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Pane & Window Navigation
nmap('<C-h>', '<C-w>h', '') -- Navigate Left
nmap('<C-j>', '<C-w>j', '') -- Navigate Down
nmap('<C-k>', '<C-w>k', '') -- Navigate Up
nmap('<C-l>', '<C-w>l', '') -- Navigate Right

-- split Management
nmap('<leader>sv', '<cmd>vsplit<CR>', 'split vertically')
nmap('<leader>sh', '<cmd>split<CR>', 'split horziontal')

nmap('<C-Up>', '<cmd>resize +2<CR>', '')
nmap('<C-Down>', '<cmd>resize -2<CR>', '')
nmap('<C-Right>', '<cmd>vertical resize +2<CR>', '')
nmap('<C-Left>', '<cmd>vertical resize -2<CR>', '')
