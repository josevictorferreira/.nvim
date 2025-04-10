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
	local filename = vim.fn.expand("%")
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

	vim.api.nvim_command("tabnew | term " .. cmd)
end

function UnsafeB64Encode()
	local selected_text = GetSelectedText()
	local encoded_text = vim.fn.system('echo -n "' .. selected_text .. '" | base64 -w 0')
	ReplaceSelectedText(encoded_text)
end

function UnsafeB64Decode()
	local selected_text = GetSelectedText()
	local decoded_text = vim.fn.system("echo -n '" .. selected_text .. "' | base64 -d | tr -d '\n'")

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

function ReplaceAllFromSelectedText()
	local selected_text = GetSelectedText()
	vim.fn.inputsave()
	local replace_text = vim.fn.input("Replace with: ")
	vim.fn.inputrestore()
	local replace_cmd = ":%s/" .. selected_text .. "/" .. replace_text .. "/g"
	vim.cmd(replace_cmd)
end

function ProjectSearchAndReplace()
	local project_root = vim.fn.system("git rev-parse --show-toplevel")
	project_root = string.gsub(project_root, "\n", "")

	if project_root == "" then
		vim.notify("Error: Not a git repository", vim.log.levels.WARN)
		return
	end

	local selected_text = GetSelectedText()
	vim.fn.inputsave()
	local replace_text = vim.fn.input("Replace with: ")
	vim.fn.inputrestore()

	local search_cmd = "grep -r -l '" .. selected_text .. "' " .. project_root
	local files = vim.fn.systemlist(search_cmd)

	for _, file in ipairs(files) do
		local replace_cmd = "sed -i 's/" .. selected_text .. "/" .. replace_text .. "/g' " .. file
		vim.fn.system(replace_cmd)
	end
end
