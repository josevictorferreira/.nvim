
function RunCode()
  local filename = vim.fn.expand('%')
  local filetype = vim.bo.filetype
  local cmd = ""

  if filetype == "ruby" then
    cmd = "ruby " .. filename
  elseif filetype == "python" then
    cmd = "python " .. filename
  elseif filetype == "elixir" then
    cmd = "elixir " .. filename
  elseif filetype == "rust" then
    cmd = "cargo run --quiet"
  elseif filetype == "sh" then
    cmd = "sh " .. filename
  end

  vim.api.nvim_command('tabnew | term ' .. cmd)
end
