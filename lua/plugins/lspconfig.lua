local function on_attach(_, bufnr)
	local signs_config = {
		[vim.diagnostic.severity.ERROR] = " ",
		[vim.diagnostic.severity.WARN] = " ",
		[vim.diagnostic.severity.HINT] = " ",
		[vim.diagnostic.severity.INFO] = " ",
	}

	vim.diagnostic.config({
		underline = true,
		signs = {
			text = signs_config,
		},
		update_in_insert = false,
		virtual_text = false,
	})

	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			vim.diagnostic.open_float(nil, {
				focusable = false,
				border = "single",
				style = "minimal",
				source = "always",
				max_width = 100,
			})
		end,
	})
end

local function setup_lsp_servers(servers)
	for server, config in pairs(servers) do
		local success, _ = pcall(function()
			config.on_attach = on_attach
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end)
		if not success then
			vim.notify("LSP: " .. server .. " has failed to load. Check logs for details.")
		end
	end
end

return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lsp_servers = require("core.utils.lsp_servers")

		setup_lsp_servers(lsp_servers)

		vim.o.updatetime = 300
	end,
}
