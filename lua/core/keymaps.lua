local nmap = require('utils.keymap').nmap
local vmap = require('utils.keymap').vmap
-- Globals
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Pane & Window Navigation
nmap('<C-h>', '<C-w>h', '') -- Navigate Left
nmap('<C-j>', '<C-w>j', '') -- Navigate Down
nmap('<C-k>', '<C-w>k', '') -- Navigate Up
nmap('<C-l>', '<C-w>l', '') -- Navigate Right

-- split Management
nmap('<leader>sv', '<CMD>vsplit<CR>', 'split vertically')
nmap('<leader>sh', '<CMD>split<CR>', 'split horziontal')

nmap('<C-Up>', '<CMD>resize +2<CR>', '')
nmap('<C-Down>', '<CMD>resize -2<CR>', '')
nmap('<C-Right>', '<CMD>vertical resize +2<CR>', '')
nmap('<C-Left>', '<CMD>vertical resize -2<CR>', '')

-- indenting
vmap('<', '<gv', 'decrease indenting')
vmap('>', '>gv', 'increase indenting')
