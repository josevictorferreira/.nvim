return {
	rust_analyzer = { filetypes = { "rs", "rust" } },
	bashls = { filetypes = { "sh", "bash" } },
	autotools_ls = { filetypes = { "config", "automake", "make", "Makefile" } },
	cssls = { filetypes = { "css" } },
	dockerls = { filetypes = { "Dockerfile", "dockerfile" } },
	docker_compose_language_service = { filetypes = { "yaml.docker-compose", "docker-compose" } },
	html = { filetypes = { "html" } },
	jsonls = { filetypes = { "json" } },
	ruff = { filetypes = { "python" } },
	pylsp = {
		filetypes = { "python" },
		root_markers = { "pyproject.toml" },
		cmd = { "uv", "run", "pylsp" },
		auto_install = false,
	},
	vimls = { filetypes = { "vim" } },
	yamlls = {
		filetypes = { "yaml", "yml" },
		settings = {
			yaml = {
				schemas = {
					["https://raw.githubusercontent.com/Kong/go-database-reconciler/refs/heads/main/pkg/file/kong_json_schema.json"] = {
						"kong*.yml",
						"kong*.yaml",
					},
				},
			},
		},
	},
	gleam = { filetypes = { "gleam" }, auto_install = false },
	dotls = { filetypes = { "dot" } },
	jdtls = { filetypes = { "java" } },
	crystalline = { filetypes = { "cr" } },
	tailwindcss = {
		filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue", "typescript.tsx" },
	},
	ruby_lsp = {
		filetypes = { "ruby" },
		cmd = { "bundle", "exec", "ruby-lsp", "stdio" },
		init_options = {
			formatter = "rubocop",
			linter = "rubocop",
		},
		auto_install = false,
	},
	sorbet = {
		filetypes = { "ruby" },
		root_markers = { "sorbet" },
		cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
		auto_install = false,
	},
	protols = { filetypes = { "proto", "protobuf" } },
	lua_ls = { filetypes = { "lua" }, settings = { Lua = { diagnostics = { globals = { "vim", "use" } } } } },
	eslint = { filetypes = { "javascript", "vue", "typescript", "typescriptreact", "typescript.tsx", "tsx" } },
	ts_ls = { filetypes = { "typescript", "javascript", "jsx", "tsx", "typescriptreact" } },
	emmet_ls = { filetypes = { "vue", "html" } },
	nixd = { filetypes = { "nix" }, auto_install = false },
	helm_ls = {
		filetypes = { "helm" },
		settings = {
			["helm-ls"] = {
				yamlls = {
					path = "yaml-language-server",
					config = {
						schemas = {
							[vim.fn.stdpath("config") .. "/schemas/helmfile.json"] = {
								"helmfile.yaml",
							},
						},
					},
				},
			},
		},
	},
}
