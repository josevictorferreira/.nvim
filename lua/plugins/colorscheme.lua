return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		local theme = os.getenv("JVF_THEME") or "dark"
		if theme == "light" then
			vim.cmd.colorscheme("tokyonight-day")
		else
			vim.cmd.colorscheme("tokyonight-night")
		end
	end,
}
