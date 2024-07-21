return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter' },
  dependencies = {
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'onsails/lspkind-nvim' }
  },
  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local types = require('cmp.types')

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end
      },

      mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.close(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping.confirm(),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      },
      sources = {
        { name = 'luasnip' },

        { name = 'nvim_lsp' },

        { name = 'buffer' },

        { name = 'path' },

        {}
      },
      completion = {
        autocomplete = {
          types.cmp.TriggerEvent.TextChanged,
        },
        completeopt = 'menu,menuone,noinsert',
      },
      formatting = {
        format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
      }
    })
  end
}
