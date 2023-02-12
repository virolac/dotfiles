local M = {}

local null_ls = require("null-ls")
local lsp_format_augroup = vim.api.nvim_create_augroup("LspFormat", {})

local function has_formatter(filetype)
  local sources = require("null-ls.sources")
  local method = null_ls.methods.FORMATTING
  local available = sources.get_available(filetype, method)

  return #available > 0
end

local function autoformat_on_save(bufnr)
  vim.api.nvim_clear_autocmds {
    group = lsp_format_augroup,
    buffer = bufnr,
  }

  vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_format_augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format { bufnr = bufnr }
    end,
  })
end

function M.setup(opts)
  local linters = null_ls.builtins.diagnostics
  local formatters = null_ls.builtins.formatting

  null_ls.setup {
    sources = {
      linters.eslint_d.with {
        diagnostics_format = "[eslint] #{m}\n(#{c})",
      },
      formatters.prettierd.with {
        filetypes = {
          "html",
          "css",
          "scss",
          "less",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "svelte",
          "json",
        },
      },
      formatters.phpcsfixer,
    },
    on_attach = function(client, bufnr)
      opts.on_attach(client, bufnr)

      local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
      local autoformat = false

      if has_formatter(filetype) then
        autoformat = client.name == "null-ls"
      else
        autoformat = not (client.name == "null-ls")
      end

      client.server_capabilities.documentFormattingProvider = autoformat
      client.server_capabilities.documentRangeFormatting = autoformat

      if autoformat then
        autoformat_on_save(bufnr)
      end
    end
  }
end

return M
