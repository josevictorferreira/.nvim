local defaults = {
	ensure_install = { "core", "stable" },
	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = false,
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
	branch = "main",
	event = "BufReadPost",
	lazy = false,
	build = ":TSUpdate",
	opts = defaults,
}
