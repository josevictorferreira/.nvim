return {
  'nvim-tree/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = false
      },
      git = {
        ignore = true
      },
      view = {
        width = 40
      }
    })
  end
}
