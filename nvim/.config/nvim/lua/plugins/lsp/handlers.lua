local handlers = {}

local function register_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local function nnoremap(key, action)
    vim.keymap.set("n", key, action, opts)
  end

  nnoremap("K", vim.lsp.buf.hover)
  nnoremap("gd", vim.lsp.buf.definition)
  nnoremap("gt", vim.lsp.buf.type_definition)
  nnoremap("gi", vim.lsp.buf.implementation)
  nnoremap("<leader>lf", vim.lsp.buf.format)
  nnoremap("<leader>lr", vim.lsp.buf.rename)
  nnoremap("<leader>lca", vim.lsp.buf.code_action)
  nnoremap("<leader>ldn", vim.diagnostic.goto_next)
  nnoremap("<leader>ldp", vim.diagnostic.goto_prev)
  nnoremap("<leader>ldo", vim.diagnostic.open_float)
  nnoremap("<leader>ldl", "<cmd>Telescope diagnostics<CR>")
end

local function autoformat_on_save()
  local formatGrp = vim.api.nvim_create_augroup("LspFormat", { clear = true })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "<buffer>",
    callback = vim.lsp.buf.format,
    group = formatGrp,
  })
end

function handlers.setup()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
    { name = "DiagnosticSignHint", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

function handlers.on_attach(_, bufnr)
  register_keymaps(bufnr)
  autoformat_on_save()
end

return handlers
