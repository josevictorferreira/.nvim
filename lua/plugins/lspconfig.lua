local function setup_lsp_servers(servers)
	for server, config in pairs(servers) do
		local success, _ = pcall(function()
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end)
		if not success then
			vim.print("LSP: " .. server .. " has failed to load")
		end
	end
end

return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.diagnostic.config({
			underline = true,
			update_in_insert = false,
			virtual_text = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "\u{F057} ",
					[vim.diagnostic.severity.WARN] = "\u{F071} ",
					[vim.diagnostic.severity.HINT] = "\u{F0EB} ",
					[vim.diagnostic.severity.INFO] = "\u{F05A} ",
				},
			},
		})

		vim.api.nvim_create_autocmd("CursorHold", {
			callback = function()
				vim.diagnostic.open_float({
					focusable = false,
					border = "single",
					style = "minimal",
					source = true,
					max_width = 100,
				})
			end,
		})

		vim.lsp.inline_completion.enable()

		vim.keymap.set("i", "<Tab>", function()
			if not vim.lsp.inline_completion.get() then
				return "<Tab>"
			end
		end, { expr = true, desc = "Accept the current inline completion" })

		local lsp_servers = require("core.utils.lsp_servers")

		setup_lsp_servers(lsp_servers)

		vim.o.updatetime = 300
	end,
	lazy = false,
}
