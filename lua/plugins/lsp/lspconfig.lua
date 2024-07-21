local lsp_servers = {
  rust_analyzer =         { filetypes = { 'rs', 'rust' } },
  bashls =                { filetypes = { 'sh', 'bash' } },
  cmake =                 { filetypes = { 'cmake' } },
  cssls =                 { filetypes = { 'css' } },
  dockerls =              { filetypes = { 'Dockerfile', 'dockerfile' } },
  gopls =                 { filetypes = { 'go' } },
  html =                  { filetypes = { 'html' } },
  jsonls =                { filetypes = { 'json' } },
  pyright =               { filetypes = { 'python' } },
  pylsp =                 { filetypes = { 'python' }, settings = { pylsp = { plugins = { black = { enabled = true } } } } },
  vimls =                 { filetypes = { 'vim' } },
  yamlls =                { filetypes = { 'yaml', 'yml' } },
  dotls =                 { filetypes = { 'dot' } },
  crystalline =           { filetypes = { 'cr' } },
  tailwindcss =           { filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue", "typescript.tsx" } },
  solargraph =            { filetypes = { 'ruby' } },
  nginx_language_server = { filetypes = { 'nginx' } },
  bufls =                 { filetypes = { 'proto', 'protobuf' } },
  lua_ls =                { filetypes = { 'lua' }, settings = { Lua = { diagnostics = { globals = { 'vim', 'use' } } } } },
  volar =                 { filetypes = { 'vue' } },
  eslint =                { filetypes = { "javascript", "vue", "typescript", "typescriptreact", "typescript.tsx", "tsx" } },
  tsserver =              { filetypes = { "typescript", "javascript", "typescriptreact", "typescript.tsx", "tsx" } },
  emmet_ls =              { filetypes = { "vue", "html", "typescript.tsx", "typescriptreact" } },
  elixirls =              { filetypes = { 'elixir' }, cmd = { vim.fn.expand("/usr/bin/elixir-ls") }, settings = { elixirLS = { dialyzerEnabled = false, fetchDeps = false } } },
}

local default_capabilites = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }
  return capabilities
end

local setup_lsp_servers = function(lspconfig, servers, capabilities)
  lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
    capabilities = capabilities,
  })
  for server, config in pairs(servers) do

    local success, result = pcall(function()
      lspconfig[server].setup(config)
    end)
    if not success then
      print("LSP: " .. server .. " has failed to load")
      print(result)
    end
  end
end

return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' }
  },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = default_capabilites()
    setup_lsp_servers(lspconfig, lsp_servers, capabilities)
  end
}
