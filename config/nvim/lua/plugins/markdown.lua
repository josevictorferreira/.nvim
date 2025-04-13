return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown',
  ft = 'markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('render-markdown').setup({})
  end,
}
