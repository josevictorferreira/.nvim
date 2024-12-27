return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_italic_functions = true
    vim.cmd("colorscheme tokyonight")
  end
}
