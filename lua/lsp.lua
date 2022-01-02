local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, rust_analyzer = lsp_installer_servers.get_server("rust_analyzer")

local path_to_elixirls = vim.fn.expand("/usr/bin/elixir-ls")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

if ok then
    if not rust_analyzer:is_installed() then
        rust_analyzer:install()
    end
		require'lspconfig'.rust_analyzer.setup{
			capabilities = capabilities
		}
end

local ok, pyright = lsp_installer_servers.get_server("pyright")
if ok then
    if not pyright:is_installed() then
        pyright:install()
    end
		require'lspconfig'.pyright.setup{
			capabilities = capabilities
		}
end

local ok, solargraph = lsp_installer_servers.get_server("solargraph")
if ok then
    if not solargraph:is_installed() then
        solargraph:install()
    end
		require'lspconfig'.solargraph.setup{
			capabilities = capabilities
		}
end

local ok, jsonls = lsp_installer_servers.get_server("jsonls")
if ok then
    if not jsonls:is_installed() then
        jsonls:install()
    end
		require'lspconfig'.jsonls.setup{
			capabilities = capabilities
		}
end

local ok, yamlls = lsp_installer_servers.get_server("yamlls")
if ok then
    if not yamlls:is_installed() then
        yamlls:install()
    end
		require'lspconfig'.yamlls.setup{
			capabilities = capabilities
		}
end

local ok, sumneko_lua = lsp_installer_servers.get_server("sumneko_lua")
if ok then
    if not sumneko_lua:is_installed() then
        sumneko_lua:install()
    end
		require'lspconfig'.sumneko_lua.setup{
			capabilities = capabilities
		}
end

local ok, html = lsp_installer_servers.get_server("html")
if ok then
    if not html:is_installed() then
        html:install()
    end
		require'lspconfig'.html.setup{
			capabilities = capabilities
		}
end

local ok, dockerls = lsp_installer_servers.get_server("dockerls")
if ok then
    if not dockerls:is_installed() then
        dockerls:install()
    end
		require'lspconfig'.dockerls.setup{
			capabilities = capabilities
		}
end

local ok, vuels = lsp_installer_servers.get_server("vuels")
if ok then
    if not vuels:is_installed() then
        vuels:install()
    end
		require'lspconfig'.vuels.setup{
			capabilities = capabilities,
      filetypes = {"vue"}
		}
end

local ok, elixirls = lsp_installer_servers.get_server("elixirls")
if ok then
    if not elixirls:is_installed() then
        elixirls:install()
    end
		require'lspconfig'.elixirls.setup{
			cmd = {path_to_elixirls},
			capabilities = capabilities,
      filetypes = {"elixir"},
      settings = {
        elixirLS = {
          dialyzerEnabled = false,
          fetchDeps = false
        }
      }
		}
end

local ok, efm = lsp_installer_servers.get_server("efm")
if ok then
    if not efm:is_installed() then
        efm:install()
    end
		require'lspconfig'.efm.setup{
			capabilities = capabilities,
      filetypes = {"elixir"}
		}
end

local ok, eslint = lsp_installer_servers.get_server("eslint")
if ok then
    if not eslint:is_installed() then
        eslint:install()
    end
		require'lspconfig'.eslint.setup{
			capabilities = capabilities,
			filetypes = {"javascript", "vue"}
		}
end

local ok, tsserver = lsp_installer_servers.get_server("tsserver")
if ok then
    if not tsserver:is_installed() then
        tsserver:install()
    end
		require'lspconfig'.tsserver.setup{
			capabilities = capabilities,
			filetypes = {"typescript"}
		}
end

local ok, emmet_ls = lsp_installer_servers.get_server("emmet_ls")
if ok then
    if not emmet_ls:is_installed() then
        emmet_ls:install()
    end
		require'lspconfig'.emmet_ls.setup{
			capabilities = capabilities,
			filetypes = {"vue", "html"}
		}
end

require('lspkind').init({
    with_text = true,

    preset = 'codicons',

    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})
