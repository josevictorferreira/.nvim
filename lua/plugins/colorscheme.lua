return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		local uv = vim.uv or vim.loop
		local state_dir = vim.fn.expand("~/.local/state/jvf-theme")

		-- Resolve the active jvf-theme profile ("light"/"dark").
		-- Prefer the `current` symlink: it resolves even when mode is "auto".
		-- Fall back to the `mode` file, then to "dark".
		local function current_profile()
			local link = uv.fs_readlink(state_dir .. "/current")
			if link then
				return vim.fs.basename(link)
			end
			local f = io.open(state_dir .. "/mode")
			if f then
				local m = vim.trim(f:read("*l") or "")
				f:close()
				if m == "light" or m == "dark" then
					return m
				end
			end
			return "dark"
		end

		local function apply()
			local scheme = (current_profile() == "light") and "tokyonight-day" or "tokyonight-night"
			if vim.g.colors_name ~= scheme then
				vim.cmd.colorscheme(scheme)
			end
		end

		apply()

		-- Live switching: re-apply when the theme switcher rewrites state.
		-- ln -sfn / echo on the state dir triggers an fs event.
		local watcher = uv.new_fs_event()
		if watcher then
			watcher:start(state_dir, {}, vim.schedule_wrap(function(err)
				if not err then
					apply()
				end
			end))
		end
		-- Safety net in case the fs event is missed.
		vim.api.nvim_create_autocmd("FocusGained", { callback = apply })
	end,
}
