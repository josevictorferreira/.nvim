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
set showtabline=2

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
if PluginExists("onedark.vim")
  colorscheme onedark
endif

if PluginExists("nvim-autopairs")
	lua require("autopairs")
endif

"" Lightline configs
if PluginExists("lightline.vim")
	let g:lightline#bufferline#number_map = {
	\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
	\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}
	lua require("lightline")
endif

"" LSP Signature
if PluginExists("lsp_signature.nvim")
	lua require("signature")
endif

"" Treesitter
if PluginExists("nvim-treesitter")
	lua require("treesitter")
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
