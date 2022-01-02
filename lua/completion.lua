-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind')
local types = require('cmp.types')

cmp.setup({
	snippet = {
		expand = function(args)
      require('snippy').expand_snippet(args.body)
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.close(),
		['<C-e>'] = cmp.mapping.close(),
		['<Tab>'] = cmp.mapping.confirm(),
	},
	sources = {
		{ name = 'buffer' },

		{ name = 'nvim_lsp' },

    { name = 'snippy' },

    { name = 'path' },

    { }
	},
  completion = {
    autocomplete = {
      types.cmp.TriggerEvent.TextChanged,
    },
    completeopt = 'menu,menuone,noinsert',
  },
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  }
})
