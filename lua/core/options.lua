local opt = vim.opt

opt.termguicolors = true

opt.syntax = "enable"

opt.guicursor = ""

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.showtabline = 2

opt.ttyfast = true
opt.lazyredraw = true
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.cmdheight = 1
opt.fileformats = { "unix", "dos", "mac" }
opt.mouse = "a"
opt.mousemodel = "popup"
opt.modeline = true
opt.modelines = 10
opt.title = true

opt.shortmess:append({ c = true })
opt.ruler = true
opt.number = true
opt.relativenumber = false

opt.backspace = { "eol", "start", "indent" }
opt.clipboard = "unnamedplus"
opt.completeopt = { "menu", "menuone", "noselect" }

local current_time = tonumber(vim.fn.strftime("%H"))
if current_time < 6 then
	opt.background = "dark"
elseif current_time < 12 then
	opt.background = "light"
else
	opt.background = "dark"
end

opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 0
opt.shiftwidth = 2
opt.hidden = true
opt.bomb = true
opt.binary = true
opt.expandtab = true
opt.scrolloff = 10

-- smoothen navigation
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100

opt.inccommand = "split"

opt.splitbelow = true
opt.splitright = true

opt.wrap = true
opt.linebreak = true

-- enable cursor blink
opt.guicursor = "n-v-c-sm:block-blinkwait175-blinkoff150-blinkon175"
