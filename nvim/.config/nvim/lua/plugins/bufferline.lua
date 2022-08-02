require("bufferline").setup {
  options = {
    numbers = "none",
    close_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    indicator_icon = "▎",
    buffer_close_icon = "",
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    custom_filter = function(bufnr)
      local exclude_ft = { "qf", "git" }
      local cur_ft = vim.bo[bufnr].filetype
      local should_filter = vim.tbl_contains(exclude_ft, cur_ft)

      if should_filter then
        return false
      end

      return true
    end,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = false,
    separator_style = "slant",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = "insert_after_current",
  },
}
