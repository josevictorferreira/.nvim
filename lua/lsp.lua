
local path_to_elixirls = vim.fn.expand("~/.cache/nvim/elixir-ls/release/language_server.sh")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local requested_servers = {
  'tsserver',
  'sumneko_lua',
  'jsonls',
  'cssls',
  'html',
  'vuels',
  'eslint',
  'solargraph',
  'yamlls',
  'elixisls',
  'dockerls',
  'dotls',
  'pyright',
  'rust_analyzer'
}

local lsp_config = require('lspconfig')

local lsp_installer_servers = require('nvim-lsp-installer.servers')
for _, requested_server in pairs(requested_servers) do
  local ok, server = lsp_installer_servers.get_server(requested_server)
  if ok then
    if not server:is_installed() then
      server:install()
    end
  end
  lsp_config[requested_server].setup{
    capabilities = capabilities
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
