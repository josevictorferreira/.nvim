local file_utils = require("core.utils.file")

if file_utils.is_file_too_large(vim.api.nvim_buf_get_name(0)) then
	file_utils.optimize_buffer_for_large_file()
else
	vim.loader.enable()
	require("core.keymaps")
	require("core.lazy")
	require("core.options")
	require("core.functions")
end
