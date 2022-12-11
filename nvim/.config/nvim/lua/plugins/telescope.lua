local telescope = require("telescope")

telescope.load_extension "fzf"
telescope.load_extension "hop"
telescope.load_extension "file_browser"
telescope.load_extension "ui-select"
telescope.load_extension "dap"
telescope.load_extension "harpoon"

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      ".git/",
      "node_modules/",
    },
  },
}
