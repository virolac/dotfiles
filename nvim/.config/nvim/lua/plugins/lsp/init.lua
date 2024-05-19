return {
  -- Language Server Protocol
  {
    "neovim/nvim-lspconfig",
    dependencies = "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
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
    end,
  },
  "j-hui/fidget.nvim",
  "nvim-lua/lsp_extensions.nvim",
  "onsails/lspkind-nvim",
  {
    "ericpubu/lsp_codelens_extensions.nvim",
    config = function()
      require("codelens_extensions").setup()
    end,
  },

  -- Mason
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      }
    end,
  },

  "williamboman/mason-lspconfig.nvim",
}