"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Display 2 tablines
set showtabline=1

"" Directories for swp files
set nobackup
set noswapfile
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=number
set fileformats=unix,dos,mac
set mousemodel=popup
set modeline
set modelines=10
set title

au BufNewFile,BufRead *.json.jbuilder set ft=ruby

"" Syntax
syntax on
set ruler
set number relativenumber

"" Fix backspace indent
set backspace=indent,eol,start

"" LSP settings
if PluginExists("nvim-lspconfig")
	lua require("lsp")
endif

"" Completions
if PluginExists("nvim-cmp")
	set completeopt=menu,menuone,noselect
	lua require("completion")
endif

"" Colorscheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $TERM="screen-256color"
set background=dark
set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
if PluginExists("neon")
  lua require("colorscheme")
endif

if PluginExists("nvim-autopairs")
	lua require("autopairs")
endif

"" LSP Signature
if PluginExists("lsp_signature.nvim")
	lua require("signature")
endif

"" Treesitter
if PluginExists("nvim-treesitter")
	lua require("treesitter")
endif

if PluginExists("telescope.nvim")
  lua require("navigation")
endif

if PluginExists("indent-blankline.nvim")
  lua require("indent_ruler")
endif

if PluginExists("lualine.nvim")
  lua require("statusbar")
endif

if PluginExists("nvim-colorizer.lua")
  lua require("colorizer").setup()
endif

"" Tabs. May be overriten by autocmd rules
set smartindent
set tabstop=2
set softtabstop=0
set shiftwidth=2
set hidden
set bomb
set binary
set expandtab
