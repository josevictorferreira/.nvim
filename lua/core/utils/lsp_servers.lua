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
	ruff = { filetypes = { "python" } },
	vimls = { filetypes = { "vim" } },
	yamlls = {
		filetypes = { "yaml", "yml" },
		on_attach = function(client, bufnr)
			if vim.bo[bufnr].filetype == "helm" then
				client.stop()
			end
		end,
	},
	gleam = { filetypes = { "gleam" }, auto_install = false },
	dotls = { filetypes = { "dot" } },
	jdtls = { filetypes = { "java" } },
	crystalline = { filetypes = { "cr" } },
	tailwindcss = {
		filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue", "typescript.tsx" },
	},
	solargraph = { filetypes = { "ruby" } },
	nginx_language_server = { filetypes = { "nginx" } },
	buf_ls = { filetypes = { "proto", "protobuf" } },
	lua_ls = { filetypes = { "lua" }, settings = { Lua = { diagnostics = { globals = { "vim", "use" } } } } },
	volar = { filetypes = { "vue" } },
	eslint = { filetypes = { "javascript", "vue", "typescript", "typescriptreact", "typescript.tsx", "tsx" } },
	ts_ls = { filetypes = { "typescript", "javascript", "jsx", "tsx", "typescriptreact" } },
	emmet_ls = { filetypes = { "vue", "html" } },
	nixd = { filetypes = { "nix" }, auto_install = false },
	elixirls = {
		filetypes = { "elixir" },
		cmd = { elixirls_path },
		settings = { elixirLS = { dialyzerEnabled = false, fetchDeps = false } },
	},
	helm_ls = { filetypes = { "helm" } },
}
