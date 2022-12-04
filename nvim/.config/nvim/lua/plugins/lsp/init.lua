local lspconfig = require("lspconfig")
local handlers = require("plugins.lsp.handlers")

handlers.setup()

-- Configuration for nvim-cmp
local lsp_status = require("lsp-status")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = vim.tbl_deep_extend("keep", capabilities, lsp_status.capabilities)
capabilities.textDocument.codeLens = { dynamicRegistration = false }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

-- C/C++
lspconfig.clangd.setup {
  on_attach = handlers.on_attach,
  capabilities = capabilities,
}

-- Rust
lspconfig.rust_analyzer.setup {
  on_attach = handlers.on_attach,
  capabilities = capabilities,
}

-- Haskell
lspconfig.hls.setup {
  on_attach = handlers.on_attach,
  capabilities = capabilities,
  settings = {
    haskell = {
      formattingProvider = "stylish-haskell",
    },
  },
}

-- Python
lspconfig.pyright.setup {
  on_attach = handlers.on_attach,
  capabilities = capabilities,
}

-- Ruby
lspconfig.solargraph.setup {
  on_attach = handlers.on_attach,
  capabilities = capabilities,
}

-- Emmet
lspconfig.emmet_ls.setup {
  on_attach = handlers.on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  },
}

-- Lua
lspconfig.sumneko_lua.setup {
  on_attach = handlers.on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      format = {
        enable = true,
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        -- Do not send telemetry data containing a randomized but unique identifier
        enable = false,
      },
    },
  },
}
