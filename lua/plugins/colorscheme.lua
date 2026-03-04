return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	setup = function()
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
