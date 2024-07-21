local lsp_servers = {
  rust_analyzer = { filetypes = { 'rs', 'rust' } },
  bashls = { filetypes = { 'sh', 'bash' } },
  cmake = { filetypes = { 'cmake' } },
  cssls = { filetypes = { 'css' } },
  dockerls = { filetypes = { 'Dockerfile', 'dockerfile' } },
  gopls = { filetypes = { 'go' } },
  html = { filetypes = { 'html' } },
  jsonls = { filetypes = { 'json' } },
  pyright = { filetypes = { 'python' } },
  pylsp = { filetypes = { 'python' }, settings = { pylsp = { plugins = { black = { enabled = true } } } } },
  vimls = { filetypes = { 'vim' } },
  yamlls = { filetypes = { 'yaml', 'yml' } },
  dotls = { filetypes = { 'dot' } },
  crystalline = { filetypes = { 'cr' } },
  tailwindcss = { filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue", "typescript.tsx" } },
  solargraph = { filetypes = { 'ruby' } },
  nginx_language_server = { filetypes = { 'nginx' } },
  bufls = { filetypes = { 'proto', 'protobuf' } },
  lua_ls = { filetypes = { 'lua' }, settings = { Lua = { diagnostics = { globals = { 'vim', 'use' } } } } },
  volar = { filetypes = { 'vue' } },
  eslint = { filetypes = { "javascript", "vue", "typescript", "typescriptreact", "typescript.tsx", "tsx" } },
  tsserver = { filetypes = { "typescript", "javascript", "typescriptreact", "typescript.tsx", "tsx" } },
  emmet_ls = { filetypes = { "vue", "html", "typescript.tsx", "typescriptreact" } },
  elixirls = { filetypes = { 'elixir' }, cmd = { vim.fn.expand("/usr/bin/elixir-ls") }, settings = { elixirLS = { dialyzerEnabled = false, fetchDeps = false } } },
}

local function on_attach(_, bufnr)
  local signs_config = {
    [vim.diagnostic.severity.ERROR] = " ",
    [vim.diagnostic.severity.WARN] = " ",
    [vim.diagnostic.severity.HINT] = " ",
    [vim.diagnostic.severity.INFO] = " "
  }

  vim.diagnostic.config({
    underline = true,
    signs = {
      text = signs_config,
    },
    update_in_insert = false,
    virtual_text = false,
  })

  vim.api.nvim_create_autocmd('CursorHold', {
    buffer = bufnr,
    callback = function()
      vim.diagnostic.open_float(nil, {
        focusable = false,
        border = 'double',
        style = 'minimal',
        source = 'always',
      })
    end
  })
end

local function default_capabilites()
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

local function setup_lsp_servers(lspconfig, servers, capabilities)
  for server, config in pairs(servers) do
    local success, result = pcall(function()
      config.on_attach = on_attach
      config.capabilities = capabilities
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

    vim.o.updatetime = 300
  end
}
