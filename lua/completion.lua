-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind')
local types = require('cmp.types')

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm()
	},
	sources = {
		{ name = 'nvim_lsp' },

		{ name = 'vsnip' },

		{ name = 'buffer' },
		{
		}
	},
  completion = {
    autocomplete = {
      types.cmp.TriggerEvent.TextChanged,
    },
    completeopt = 'menu,menuone,noinsert',
		autocomplete = false
  },
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  }
})
