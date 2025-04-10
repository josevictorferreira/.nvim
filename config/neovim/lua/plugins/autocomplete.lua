local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter' },
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'onsails/lspkind-nvim',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'honza/vim-snippets'
  },
  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local types = require('cmp.types')
    local luasnip = require('luasnip')

    require("luasnip.loaders.from_snipmate").lazy_load()

    cmp.setup({
      snippet    = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end
      },

      mapping    = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.close(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping.confirm(),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      },
      sources    = {
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
        completeopt = 'menu,menuone,preview,noselect',
      },
      view       = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
      },
      window     = {
        completion = {
          border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
        },
        documentation = {
          border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
        }
      },
      formatting = {
        format = function(_, vim_item)
          vim_item.kind = ' ' .. (cmp_kinds[vim_item.kind] or '')
          return vim_item
        end,
      }
    })
  end
}
