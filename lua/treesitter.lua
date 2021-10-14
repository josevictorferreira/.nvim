require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      ["foo.bar"] = "Identifier",
    },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
