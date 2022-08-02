local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

local au = vim.api.nvim_create_autocmd

-- Briefly highlight yanked region

au("TextYankPost", {
  pattern = "*",
  command = "lua vim.highlight.on_yank()",
  group = augroup("HighlightOnYank"),
  desc = "Briefly highlight yanked region",
})
