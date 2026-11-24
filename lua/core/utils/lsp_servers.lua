-- Only override `filetypes` to deliberately narrow a server's scope. Omitting it
-- inherits nvim-lspconfig's list; setting it *replaces* that list, it does not merge.
return {
	rust_analyzer = {},
	bashls = {},
	autotools_ls = {},
	cssls = {},
	dockerls = {},
	docker_compose_language_service = {},
	html = {},
	jsonls = {},
	ruff = {
		root_markers = { "pyproject.toml" },
		cmd = { "uv", "run", "ruff", "server" },
	},
	pylsp = {
		root_markers = { "pyproject.toml" },
		cmd = { "uv", "run", "pylsp" },
	},
	vimls = {},
	yamlls = {
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
	gleam = {},
	dotls = {},
	jdtls = {},
	tailwindcss = {
		filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue" },
	},
	ruby_lsp = {
		cmd = { "bundle", "exec", "ruby-lsp", "stdio" },
		init_options = {
			formatter = "rubocop",
			linter = "rubocop",
		},
	},
	sorbet = {
		cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
	},
	protols = {},
	lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim", "use" } } } } },
	luau_lsp = {
		root_markers = { ".luaurc", ".git" },
		settings = {
			["luau-lsp"] = {
				platform = { type = "standard" },
				types = { roblox = false },
				sourcemap = { enabled = false },
				completion = { imports = { enabled = true } },
				inlayHints = {
					parameterNames = "literals",
					variableTypes = true,
					functionReturnTypes = true,
				},
			},
		},
	},
	eslint = {},
	ts_ls = {},
	emmet_ls = { filetypes = { "vue", "html" } },
	nixd = {},
	gopls = {},
	helm_ls = {
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
