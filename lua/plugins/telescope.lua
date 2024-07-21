local set_telescope_keymap = function()
  local map = vim.api.nvim_set_keymap
  local options = { noremap = true, silent = true }

  map('n', '<leader>p', ':Telescope find_files<CR>', options)
  map('n', '<leader>fg', ':Telescope live_grep<CR>', options)
  map('n', '<leader>f', ':Telescope live_grep<CR>', options)
  map('n', '<leader>fb', ':Telescope buffers<CR>', options)
  map('n', '<leader>fh', ':Telescope help_tags<CR>', options)
  map('n', '<leader><tab>', ':NvimTreeToggle<CR>', options)
end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = { "node_modules", "target", ".git", ".github", ".helm" },
        set_env = { ["COLORTERM"] = "truecolor" },
        layout_strategy = "horizontal",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        layout_config = {
          horizontal = {
            width = 0.9,
            height = 0.9,
            prompt_position = "bottom",
            preview_cutoff = 120,
            preview_width = 75,
            horizontal = { mirror = false },
            vertical = { mirror = false },
          },
        },
        border = {},
        borderchars = {
          prompt = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' },
          results = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' },
          preview = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' },
        },
        color_devicons = true,
        use_less = true,
        find_command = {
          "rg",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          only_sort_text = true,
        },
      }
    })

    require('telescope').load_extension('fzf')

    set_telescope_keymap()
  end
}
