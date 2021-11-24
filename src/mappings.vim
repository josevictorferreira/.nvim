let mapleader = "\<Space>"

inoremap <cr> <c-x><c-z><cr>

"" Reload nvim config
nnoremap <leader>rl :source $MYVIMRC<CR> 

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Moving between buffers
nnoremap <silent> <S-l> :bn<CR>
nnoremap <silent> <S-h> :bp<CR>
nnoremap <silent> <leader>c :bd!<CR>

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
if PluginExists("nerdtree")
	nnoremap <silent><leader><tab> :NERDTreeToggle<CR>
endif

"" Telescope mappings
if PluginExists("telescope.nvim")
	nnoremap <leader>p <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>f <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
endif

if PluginExists("lightline.vim")
	nmap <Leader>1 <Plug>lightline#bufferline#go(1)
	nmap <Leader>2 <Plug>lightline#bufferline#go(2)
	nmap <Leader>3 <Plug>lightline#bufferline#go(3)
	nmap <Leader>4 <Plug>lightline#bufferline#go(4)
	nmap <Leader>5 <Plug>lightline#bufferline#go(5)
	nmap <Leader>6 <Plug>lightline#bufferline#go(6)
	nmap <Leader>7 <Plug>lightline#bufferline#go(7)
	nmap <Leader>8 <Plug>lightline#bufferline#go(8)
	nmap <Leader>9 <Plug>lightline#bufferline#go(9)
	nmap <Leader>0 <Plug>lightline#bufferline#go(10)
	nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
	nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
	nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
	nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
	nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
	nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
	nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
	nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
	nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
	nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)
endif
