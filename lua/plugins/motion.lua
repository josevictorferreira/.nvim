return {
  'phaazon/hop.nvim',
  branch = 'v2',
  config = function()
    require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }

    vim.api.nvim_set_keymap('n', 'f', ":HopWord<CR>", { noremap = true, silent = true })
  end
}
