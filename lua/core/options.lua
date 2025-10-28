vim.g.do_filetype_lua = 1
vim.g.cursorhold_updatetime = 100
vim.g.highlighturl_enabled = true
vim.g.zipPlugin = false
vim.g.load_black = false
vim.g.loaded_2html_plugin = true
vim.g.loaded_getscript = true
vim.g.loaded_getscriptPlugin = true
vim.g.loaded_gzip = true
vim.g.loaded_logipat = true
vim.g.loaded_matchit = true
vim.g.loaded_netrw = true
vim.g.loaded_netrwFileHandlers = true
vim.g.loaded_netrwPlugin = true
vim.g.loaded_netrwSettngs = true
vim.g.loaded_remote_plugins = true
vim.g.loaded_tar = true
vim.g.loaded_tarPlugin = true
vim.g.loaded_zip = true
vim.g.loaded_zipPlugin = true
vim.g.loaded_vimball = true
vim.g.loaded_vimballPlugin = true
vim.g.loaded_python_provider = 0

vim.opt.termguicolors = true
vim.opt.syntax = "enable"

vim.opt.guicursor = ""

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.showtabline = 2
vim.opt.smartindent = true

vim.opt.ttyfast = true
vim.opt.lazyredraw = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.cmdheight = 1
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.opt.mouse = "a"
vim.opt.mousemodel = "popup"
vim.opt.modeline = true
vim.opt.modelines = 10
vim.opt.title = true

vim.opt.shortmess:append({ c = true })
vim.opt.ruler = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.backspace = { "eol", "start", "indent" }
vim.opt.clipboard = "unnamedplus"

vim.opt.hidden = true
vim.opt.bomb = true
vim.opt.binary = true
vim.opt.scrolloff = 10

-- smoothen navigation
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 10
vim.opt.updatetime = 100

vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = true
vim.opt.linebreak = true

-- enable cursor blink
vim.opt.guicursor = "n-v-c-sm:block-blinkwait175-blinkoff150-blinkon175"
