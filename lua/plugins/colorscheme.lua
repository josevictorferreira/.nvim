return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = false,
			term_colors = true,
			no_italic = true,
			no_bold = false,
			background = {
				light = "latte",
				dark = "mocha",
			},
			integrations = {
				cmp = false,
				gitsigns = true,
				nvimtree = false,
				treesitter = true,
				blink_cmp = {
					enabled = true,
					style = "bordered",
				},
				telescope = {
					enabled = true,
				},
				notify = false,
				mini = {
					enabled = false,
					indentscope_color = "",
				},
				render_markdown = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
