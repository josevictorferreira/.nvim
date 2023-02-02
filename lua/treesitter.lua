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
    'vue',
    'yaml'
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
    disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
  },
  indent = {
    enable = true
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
