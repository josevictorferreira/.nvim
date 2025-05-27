return {
	"yetone/avante.nvim",
	opts = {
		endpoint = "claude",
		claude = {
			endpoint = "https://api.anthropic.com",
			model = "claude-sonnet-4-20250514",
			timeout = 30000,
			temperature = 0,
			max_tokens = 20480,
			disable_tools = true,
		},
	},
	event = "VeryLazy",
	lazy = true,
	version = false,
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		"zbirenbaum/copilot.lua",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
