local defaults = {
  ensure_installed = {
    'css',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'lua',
    'markdown',
    'php',
    'python',
    'scss',
    'tsx',
    'typescript',
    'dot',
    'elixir',
    'make',
    'dockerfile',
    'ruby',
    'rust',
    'regex',
    'vue'
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
  },
}

require'nvim-treesitter.configs'.setup(defaults)
