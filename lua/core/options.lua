local opt = vim.opt

-- tabs & indentition
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.wrap = false

-- appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = '120'
opt.signcolumn = 'yes'
opt.scrolloff = 10
opt.cmdheight = 1
opt.showmode = false

-- behaviour
opt.hidden = true
opt.hlsearch = true
opt.equalalways = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.backspace = 'indent,eol,start'
opt.completeopt = 'menu,menuone,noinsert'
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.modifiable = true
opt.clipboard:append('unnamedplus')
opt.updatetime = 300
opt.shortmess:append('c')
