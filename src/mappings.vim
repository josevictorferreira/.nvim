let mapleader = "\<Space>"

inoremap <cr> <c-x><c-z><cr>

"" Reload nvim config
nnoremap <leader>rl :source $MYVIMRC<CR> 

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Copy text to outside
noremap YY "+y<CR>

"" Moving between buffers
nnoremap <silent> <S-l> :bn<CR>
nnoremap <silent> <S-h> :bp<CR>
nnoremap <silent> <leader>c :bd!<CR>

"" Run ruby code
nnoremap <C-r> :r !ruby %<CR>

"" Lint code
nnoremap <silent> <leader>l :lua vim.lsp.buf.formatting()<CR>

"" Splitting buffers
nmap <leader>s<left>   :leftabove  vsplit<CR>
nmap <leader>s<right>  :rightbelow vsplit<CR>
nmap <leader>s<up>     :leftabove  split<CR>
nmap <leader>s<down>   :rightbelow split<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Opening terminal
nnoremap <silent> <leader>sh :terminal<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Clean search(highlight)
nnoremap <silent><leader>, :noh<cr>

"" Nerdtree mappings
if PluginExists("nvim-tree.lua")
  nnoremap <leader><tab> :NvimTreeToggle<CR>
  nnoremap <silent><leader>r :NvimTreeRefresh<CR>
endif

"" VimTest mappings
if PluginExists("vim-test")
  nmap <silent> t<C-n> :TestNearest<CR>
  nmap <silent> t<C-f> :TestFile<CR>
  nmap <silent> t<C-s> :TestSuite<CR>
  nmap <silent> t<C-l> :TestLast<CR>
  nmap <silent> t<C-g> :TestVisit<CR>
endif

"" Ultest
if PluginExists("vim-ultest")
  nnoremap <leader><C-t> :UltestSummary!<CR>
  nnoremap <leader>t :UltestNearest<CR>
  nnoremap <leader>T :Ultest<CR>
endif

"" Telescope mappings
if PluginExists("telescope.nvim")
	nnoremap <leader>p <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>f <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
endif

if PluginExists("trouble.nvim")
  nnoremap <leader>xx <cmd>TroubleToggle<CR>
  nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<CR>
  nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<CR>
  nnoremap <leader>xq <cmd>TroubleToggle quickfix<CR>
  nnoremap <leader>xl <cmd>TroubleToggle loclist<CR>
  nnoremap gR <cmd>TroubleToggle lsp_references<CR>
endif

"" Update Neovim
nnoremap <C-U> :exec UpdateNeovim()<CR>
