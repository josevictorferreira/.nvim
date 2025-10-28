return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		input = {
			enabled = true,
		},
		picker = {
			enabled = true,
			actions = {
				sidekick_send = function(...)
					return require("sidekick.cli.picker.snacks").send(...)
				end,
			},
			win = {
				input = {
					keys = {
						["<a-a>"] = {
							"sidekick_send",
							mode = { "n", "i" },
						},
					},
				},
			},
		},
	},
}
