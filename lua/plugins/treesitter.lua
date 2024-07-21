return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-refactor', lazy = true },
    { 'windwp/nvim-ts-autotag',                   lazy = true }
  },
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local defaults = {
      ensure_installed = {
        'css',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
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
        'yaml',
        'bash',
        'vim',
        'query',
        'vimdoc',
        'c',
        'zig'
      },
      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
        disable = function(_, buf)
          local max_filesize = 100 * 1024   -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = true,
        disable = {
          'ruby'
        }
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

    require 'nvim-treesitter.configs'.setup(defaults)
  end
}
