require('telescope').setup({
  defaults = {
    file_ignore_patterns = {"node_modules", "target", ".git", ".github", ".helm"},
    vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }
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
require('telescope').load_extension('file_browser')
