return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "vim-test/vim-test",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "olimorris/neotest-rspec",
      "nvim-neotest/neotest-vim-test",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require("neotest-python") {
            dap = { justMyCode = false },
          },
          require("neotest-plenary"),
          require("neotest-rspec"),
          require("neotest-vim-test") {
            ignore_file_types = { "python", "vim", "lua", "ruby" },
          },
        },
      }
    end,
  },
}