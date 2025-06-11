local file_utils = require("core.utils.file")

if file_utils.is_file_too_large(vim.fn.expand("%:p")) then
	file_utils.optimize_buffer_for_large_file()
else
	require("core")
end
