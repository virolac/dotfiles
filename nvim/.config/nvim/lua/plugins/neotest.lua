local M = {}

function M.setup()
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
end

return M
