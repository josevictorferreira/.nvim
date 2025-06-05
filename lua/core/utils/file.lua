local MAX_FILESIZE = 314572800 -- 300 MB

local function is_file_too_large(filepath)
	local ok, stats = pcall(vim.loop.fs_stat, filepath)
	if ok and stats and stats.size > MAX_FILESIZE then
		return true
	end
	return false
end

return {
	is_file_too_large = is_file_too_large,
}
