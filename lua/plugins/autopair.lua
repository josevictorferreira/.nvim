return {
	"windwp/nvim-autopairs",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local npairs = require("nvim-autopairs")

		npairs.setup({
			map_cr = true,
			check_ts = true,
		})

		npairs.add_rules(require("nvim-autopairs.rules.endwise-elixir"))
		npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
		npairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))
	end,
}
