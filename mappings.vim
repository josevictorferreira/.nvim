let mapleader = "\<Space>"
if PluginExists("nerdtree")
	nnoremap <silent><leader>3 :NERDTreeToggle<CR>
endif
if PluginExists("telescope.nvim")
	nnoremap <leader>p <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>f <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
endif
