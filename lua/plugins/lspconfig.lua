local function on_attach(_, _bufnr)
end

local function setup_lsp_servers(servers)
	for server, config in pairs(servers) do
		local success, _ = pcall(function()
			config.on_attach = on_attach
			config.capabilities = vim.lsp.protocol.make_client_capabilities()
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
		require("lspconfig.configs")

		local signs_config = {
			[vim.diagnostic.severity.ERROR] = "\u{F057} ",
			[vim.diagnostic.severity.WARN] = "\u{F071} ",
			[vim.diagnostic.severity.HINT] = "\u{F0EB} ",
			[vim.diagnostic.severity.INFO] = "\u{F05A} ",
		}

		vim.diagnostic.config({
			underline = true,
			signs = true,
			update_in_insert = false,
			virtual_text = false,
		})

		local severity_names = {
			[vim.diagnostic.severity.ERROR] = "Error",
			[vim.diagnostic.severity.WARN] = "Warn",
			[vim.diagnostic.severity.HINT] = "Hint",
			[vim.diagnostic.severity.INFO] = "Info",
		}

		for severity, icon in pairs(signs_config) do
			local name = "DiagnosticSign" .. severity_names[severity]
			local ok, _ = pcall(vim.fn.sign_undefine, name)
			vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
		end

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
}
