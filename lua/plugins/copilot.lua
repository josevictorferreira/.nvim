return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			server_opts_overrides = {
				settings = {
					telemetry = {
						telemetryLevel = "off",
					},
				},
			},
			server = {
				type = "binary",
			},
			panel = {
				auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = {
					position = "bottom",
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 75,
				trigger_on_accept = true,
				keymap = {
					accept = "<C-y>",
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				yaml = function()
					if string.match(vim.fn.expand("%:t"), "^%docker-compose.*") then
						return true
					end
					if string.match(vim.fn.expand("%:t"), "^%helmfile.*") then
						return true
					end
					return false
				end,
				yml = function()
					if string.match(vim.fn.expand("%:t"), "^%docker-compose*") then
						return true
					end
					if string.match(vim.fn.expand("%:t"), "^%helmfile*") then
						return true
					end
					return false
				end,
				markdown = function()
					if string.match(vim.fn.expand("%:t"), "^%README*") then
						return true
					end
					return false
				end,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				sql = false,
				csv = false,
				cvs = false,
				sh = function()
					if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env*") then
						return false
					end
					if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
						return false
					end
					return true
				end,
			},
			copilot_model = "gpt-4o-copilot",
			sherver_opts_overrides = {},
		})
	end,
}
