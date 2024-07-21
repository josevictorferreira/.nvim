function ReplaceSelectedText(newText)
  local start = vim.fn.getpos("'<")
  local _end = vim.fn.getpos("'>")

  local start_row, start_col = start[2], start[3]
  local end_row, end_col = _end[2], _end[3]

  end_col = end_col + 1

  local buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_buf_set_text(buf, start_row - 1, start_col - 1, end_row - 1, end_col - 1, { newText })
end

function GetSelectedText()
  local startPos = vim.fn.getpos("'<")
  local endPos = vim.fn.getpos("'>")

  local startLine, startCol = startPos[2] - 1, startPos[3] - 1
  local endLine, endCol = endPos[2] - 1, endPos[3]
  local buffer = vim.api.nvim_get_current_buf()

  local lines = vim.api.nvim_buf_get_text(buffer, startLine, startCol, endLine, endCol, {})

  return table.concat(lines, "\n")
end

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

function UnsafeB64Encode()
  local selected_text = GetSelectedText()
  local encoded_text = vim.fn.system('echo -n "' .. selected_text .. '" | base64 -w 0')
  ReplaceSelectedText(encoded_text)
end

function UnsafeB64Decode()
  local selected_text = GetSelectedText()
  local decoded_text = vim.fn.system('echo -n "' .. selected_text .. '" | base64 -d | tr -d \'\n\'')

  local error_message = "Error: Can't decode selected text, is the text actually an Base64 string?"

  vim.notify(error_message, vim.log.levels.WARN)
  ReplaceSelectedText(decoded_text)
end

function B64Encode()
  local success = pcall(UnsafeB64Encode)

  if not success then
    local error_message = "Error: Can't decode selected text, is the text actually an Base64 string?"

    vim.notify(error_message, vim.log.levels.WARN)
  end
end
