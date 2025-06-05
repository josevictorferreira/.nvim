local file_utils = require("core.utils.file")

local defaults = {
	ensure_install = { "core", "stable" },
	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = false,
		disable = function(_, buf)
			return file_utils.is_file_too_large(vim.api.nvim_buf_get_name(buf))
		end,
	},
	sync_install = false,
	auto_install = true,
	indent = {
		enable = true,
		disable = {
			"ruby",
		},
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = false },
	},
}

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup(defaults)
	end,
}
