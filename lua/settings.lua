local opt = vim.opt
local cmd = vim.cmd

cmd([[
	filetype plugin indent on
]])

opt.syntax = 'enable'

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fileencodings = 'utf-8'

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.showtabline = 1

opt.ttyfast = true
opt.lazyredraw = true
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.cmdheight = 1
opt.updatetime = 300
opt.signcolumn = 'number'
opt.fileformats = { 'unix', 'dos', 'mac' }
opt.mouse = 'a'
opt.mousemodel = 'popup'
opt.modeline = true
opt.modelines = 10
opt.title = true

opt.shortmess:append({ c = true })
opt.ruler = true
opt.number = true
opt.relativenumber = true

opt.backspace = { 'eol', 'start', 'indent' }
opt.clipboard = 'unnamedplus'

opt.completeopt = { 'menu', 'menuone', 'noselect' }

opt.background = "dark"

opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 0
opt.shiftwidth = 2
opt.hidden = true
opt.bomb = true
opt.binary = true
opt.expandtab = true

-- performance
opt.redrawtime = 1500
opt.timeoutlen = 250
opt.ttimeoutlen = 10
opt.updatetime = 100

-- setup plugins settings
require("lsp")
require("completion")
require("colorscheme")
require("autopairs")
require("signature")
require("treesitter")
require("navigation")
require("statusbar")
require("tabline")
require("colorizer").setup()
require("error_messages")
require("Comment").setup()
require("file_explorer")
