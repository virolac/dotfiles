local M = {}

function M.setup()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend("keep", capabilities, require("lsp-status").capabilities)
  capabilities.textDocument.codeLens = { dynamicRegistration = false }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  local handlers = require("plugins.lsp.handlers")
  local null_ls = require("plugins.lsp.null_ls")
  local servers = require("plugins.lsp.servers")

  local opts = {
    on_attach = handlers.on_attach,
    capabilities = capabilities,
  }

  handlers.setup()
  null_ls.setup(opts)
  servers.setup(opts)
end

return M
