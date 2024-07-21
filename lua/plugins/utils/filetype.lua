return {
  'nathom/filetype.nvim',
  config = function()
    require("filetype").setup({
      overrides = {
        extensions = {
          cr = "crystal",
          sql = "sql",
          html = "html",
          sh = "bash",
        },
        complex = {
          ["nginx.conf"] = "nginx",
        }
      }
    })
  end
}
