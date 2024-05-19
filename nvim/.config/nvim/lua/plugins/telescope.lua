return {
  -- Fuzzy finder on steroids
  {
    "nvim-telescope/telescope.nvim",
    config =  function ()
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
            "vendor",
          },
        },
      }
    end,
  },

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope-dap.nvim", dependencies = "mfussenegger/nvim-dap" },
  "nvim-telescope/telescope-hop.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "ThePrimeagen/harpoon",
}