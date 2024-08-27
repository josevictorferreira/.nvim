local elixirls_path = vim.fn.expand("/usr/bin/elixir-ls")

return {
	rust_analyzer = { filetypes = { "rs", "rust" } },
	bashls = { filetypes = { "sh", "bash" } },
	cmake = { filetypes = { "cmake" } },
	cssls = { filetypes = { "css" } },
	dockerls = { filetypes = { "Dockerfile", "dockerfile" } },
	docker_compose_language_service = { filetypes = { "yaml.docker-compose", "docker-compose" } },
	gopls = { filetypes = { "go" } },
	html = { filetypes = { "html" } },
	jsonls = { filetypes = { "json" } },
	ruff_lsp = { filetypes = { "python" } },
	vimls = { filetypes = { "vim" } },
	yamlls = { filetypes = { "yaml", "yml" } },
	dotls = { filetypes = { "dot" } },
	crystalline = { filetypes = { "cr" } },
	tailwindcss = {
		filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue", "typescript.tsx" },
	},
	ruby_lsp = { filetypes = { "ruby" } },
	nginx_language_server = { filetypes = { "nginx" } },
	bufls = { filetypes = { "proto", "protobuf" } },
	lua_ls = { filetypes = { "lua" }, settings = { Lua = { diagnostics = { globals = { "vim", "use" } } } } },
	volar = { filetypes = { "vue" } },
	eslint = { filetypes = { "javascript", "vue", "typescript", "typescriptreact", "typescript.tsx", "tsx" } },
	tsserver = { filetypes = { "typescript", "javascript", "typescriptreact", "typescript.tsx", "tsx" } },
	emmet_ls = { filetypes = { "vue", "html", "typescript.tsx", "typescriptreact" } },
	elixirls = {
		filetypes = { "elixir" },
		cmd = { elixirls_path },
		settings = { elixirLS = { dialyzerEnabled = false, fetchDeps = false } },
	},
}
