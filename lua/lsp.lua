local path_to_elixirls = vim.fn.expand("/usr/bin/elixir-ls")

local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

lspconfig.rust_analyzer.setup{
  capabilities = capabilities
}

lspconfig.gopls.setup{
  capabilities = capabilities
}

lspconfig.dotls.setup{
  capabilities = capabilities
}

lspconfig.crystalline.setup{
  capabilities = capabilities,
  filetypes = {"crystal", "cr"}
}

lspconfig.bashls.setup{
  capabilities = capabilities
}

lspconfig.pyright.setup{
  capabilities = capabilities
}

lspconfig.solargraph.setup{
  capabilities = capabilities
}

lspconfig.jsonls.setup{
  capabilities = capabilities
}

lspconfig.yamlls.setup{
  capabilities = capabilities
}

lspconfig.lua_ls.setup{
  capabilities = capabilities,
  settings = {
      Lua = {
          diagnostics = {
              globals = { 'vim', 'use' }
          }
      }
  }
}

lspconfig.html.setup{
  capabilities = capabilities
}

lspconfig.dockerls.setup{
  capabilities = capabilities
}

lspconfig.docker_compose_language_service.setup{
  capabilities = capabilities
}

lspconfig.volar.setup{
  capabilities = capabilities,
  filetypes = {"vue"}
}

lspconfig.elixirls.setup{
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

lspconfig.efm.setup{
  capabilities = capabilities,
  filetypes = {"elixir"}
}

lspconfig.eslint.setup{
  capabilities = capabilities,
  filetypes = {"javascript", "vue"}
}

lspconfig.tsserver.setup{
  capabilities = capabilities,
  filetypes = {"typescript"}
}

lspconfig.emmet_ls.setup{
  capabilities = capabilities,
  filetypes = {"vue", "html"}
}

require('lspkind').init({
    mode = 'symbol_text',

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
