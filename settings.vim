"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
set fileformats=unix,dos,mac

"" Syntax
syntax on
set ruler
set number relativenumber

"" Colorscheme
if PluginExists("onedark.vim")
  colorscheme onedark
endif

"" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set hidden
set bomb
set binary

"" Lightline configs
if PluginExists("lightline.vim")
	let g:lightline = { 'separator': { 'left': '', 'right': '' }, 'subseparator': { 'left': '', 'right': '' } }
endif
