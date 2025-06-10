return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	lazy = false,
	event = "InsertEnter",
	opts = {
		cmdline = {
			enabled = false,
		},
		keymap = {
			preset = "none",
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<C-y>"] = {
				function(cmp)
					if require("copilot.suggestion").is_visible() then
						return require("copilot.suggestion").accept()
					else
						return cmp.select_and_accept()
					end
				end,
			},
			["<Tab>"] = { "select_and_accept", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
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
		completion = {
			documentation = {
				auto_show = true,
				window = {
					border = "single",
				},
			},
			trigger = {
				show_on_keyword = true,
				show_on_trigger_character = true,
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
