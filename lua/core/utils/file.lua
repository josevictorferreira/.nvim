local MAX_FILESIZE = 314572800 -- 300 MB

local function is_file_too_large(filepath)
	local ok, stats = pcall(vim.loop.fs_stat, filepath)
	if ok and stats and stats.size > MAX_FILESIZE then
		return true
	end
	return false
end

local function optimize_buffer_for_large_file(bufnr)
	bufnr = bufnr or 0

	vim.api.nvim_buf_call(bufnr, function()
		vim.cmd("syntax off")
	end)

	vim.bo[bufnr].filetype = ""
	vim.bo[bufnr].syntax = ""
	vim.bo[bufnr].indentexpr = ""
	vim.bo[bufnr].indentkeys = ""

	vim.o.lazyredraw = true
	vim.o.incsearch = false
	vim.o.hlsearch = false
end

return {
	is_file_too_large = is_file_too_large,
	optimize_buffer_for_large_file = optimize_buffer_for_large_file,
}
