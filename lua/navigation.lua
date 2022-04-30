require('telescope').setup({
  defaults = { file_ignore_patterns = {"node_modules", "target", ".git", ".github", ".helm"} },
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
      hidden = true
    }
  }
})

--require('telescope').load_extension('fzf')
