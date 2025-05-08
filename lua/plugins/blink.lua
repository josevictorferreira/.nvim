return {
	"saghen/blink.cmp",
	dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
	version = "1.*",
	lazy = false,
	opts = {
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<C-y>"] = {
				function(cmp)
					if require("copilot.suggestion").is_visible() then
						return require("copilot.suggestion").accept()
					else
						return cmp.mapping.confirm({ select = true })
					end
				end,
			},
			["<Tab>"] = { "select_and_accept", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback_to_mappings" },
			["<C-n>"] = { "select_next", "fallback_to_mappings" },
			["<C-d>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		snippets = { preset = "luasnip" },
		completion = {
			documentation = {
				auto_show = true,
				window = {
					border = "single",
				},
			},
			menu = { border = "single" },
		},
		sources = {
			default = { "lsp", "snippets", "path", "buffer" },
		},
		signature = { enabled = true },
		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				"exact",
				"score",
				"sort_text",
			},
		},
	},
	opts_extend = { "sources.default" },
}
