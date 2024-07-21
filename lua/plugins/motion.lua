return {
  'phaazon/hop.nvim',
  lazy = true,
  branch = 'v2',
  cmd = 'HopWord',
  config = function()
    require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }

    vim.api.nvim_set_keymap('n', 'f', ":HopWord<CR>", { noremap = true, silent = true })
  end
}
