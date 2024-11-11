return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local kanagawa_colorscheme = require("kanagawa")
		kanagawa_colorscheme.setup({
			compile = true,
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false,
			dimInactive = false,
			terminalColors = true,
			theme = "wave",
			background = {
				dark = "wave",
				light = "lotus",
			},
		})
		kanagawa_colorscheme.load("wave")
	end,
}
