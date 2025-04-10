return {
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      lua = {
        {
          lintCommand = "luacheck --globals vim --filename ${INPUT} --formatter plain -",
          lintStdin = true,
          lintIgnoreExitCode = false,
          lintFormats = {
            "%f:%l:%c: %m",
          },
        },
      },
      sh = {
        {
          lintCommand = "shellcheck -f gcc -x",
          lintSource = "shellcheck",
          lintFormats = {
            "%f:%l:%c: %trror: %m",
            "%f:%l:%c: %tarning: %m",
            "%f:%l:%c: %tote: %m",
          },
        },
      },
      markdown = {
        {
          lintCommand = "markdownlint -s",
          lintStdin = true,
          lintFormats = {
            "%f:%l %m",
          },
          lintIgnoreExitCode = true,
        },
      },
    },
  }
}
