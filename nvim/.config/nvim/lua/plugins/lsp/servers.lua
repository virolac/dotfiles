local M = {}

-- Server specific configuration
local servers_config = {
  -- Haskell
  hls = {
    settings = {
      haskell = {
        formattingProvider = "stylish-haskell",
      },
    },
  },
  -- Emmet
  emmet_ls = {
    filetypes = {
      "html", "php",
      "css", "sass", "scss", "less",
      "javascript", "javascriptreact",
      "typescript", "typescriptreact",
      "vue", "svelte"
    },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    },
  },
  -- Lua
  sumneko_lua = {
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
  },
}

-- Automatic server configuration
local servers = {
  "clangd",
  "emmet_ls",
  "pyright",
  "rust_analyzer",
  "solargraph",
  "sumneko_lua",
  "tsserver",
}

local lspconfig = require("lspconfig")

function M.setup(opts)
  for _, name in pairs(servers) do
    local config = servers_config[name] or {}
    config.on_attach = opts.on_attach
    config.capabilities = opts.capabilities

    lspconfig[name].setup(config)
  end
end

return M
