return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	branch = "master",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
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
				keymap = {
					accept = "<C-Y>",
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
			copilot_node_command = "node", -- Node.js version must be > 18.x
			sherver_opts_overrides = {},
		})
	end,
}
