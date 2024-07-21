return {
  'williamboman/mason.nvim',
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lsp_servers = require("plugins.lsp.lspconfig").lsp_servers
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "double",
				width = 0.8,
				height = 0.8,
			},
		})
    mason_lspconfig.setup({
      ensure_installed = lsp_servers,
      automatic_installation = true,
    })
  end
}
