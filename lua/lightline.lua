vim.g['lightline'] = {
  colorscheme = 'one',
  active = {
    left = {{'mode', 'paste'}, {'readonly', 'filename', 'modified'}}
  },
  tabline = {
    left = {{'buffers'}},
    right = {{'close'}}
  },
  component_expand = {
    buffers = 'lightline#bufferline#buffers'
  },
  component_type = {
    buffers = 'tabsel'
  },
	separator = {
		left = '',
		right = ''
	},
	subseparator = {
		left = '',
		right = ''
	}
}

vim.g['lightline#bufferline#show_number']  = 1
vim.g['lightline#bufferline#shorten_path'] = 0
vim.g['lightline#bufferline#unnamed']      = '[No Name]'
vim.g['lightline#bufferline#show_number'] = 2
vim.g['lightline#bufferline#enable_nerdfont'] = 1
