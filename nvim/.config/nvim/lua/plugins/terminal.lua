return {
  "s1n7ax/nvim-terminal",
  config = function()
    require("nvim-terminal").setup()
    vim.cmd [[tnoremap <esc> <c-\><c-n>]]
  end,
}