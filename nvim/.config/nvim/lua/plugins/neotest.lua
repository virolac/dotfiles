local M = {}
local nnoremap = require("keymaps.utils").nnoremap

function M.setup()
  require("neotest").setup {
    adapters = {
      require("neotest-python") {
        dap = { justMyCode = false },
      },
      require("neotest-plenary"),
      require("neotest-vim-test") {
        ignore_file_types = { "python", "vim", "lua" },
      },
    },
  }
end

nnoremap("<leader>na", function() require("neotest").run.attach() end, "[Neotest] Attach")
nnoremap("<leader>nf", function() require("neotest").run.run(vim.fn.expand("%")) end, "[Neotest] Run file")
nnoremap("<leader>nF", function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end, "[Neotest] Debug file")
nnoremap("<leader>nl", function() require("neotest").run.run_last() end, "[Neotest] Run last")
nnoremap("<leader>nL", function() require("neotest").run.run_last({ strategy = "dap" }) end, "[Neotest] Debug last")
nnoremap("<leader>nn", function() require("neotest").run.run() end, "[Neotest] Run nearest")
nnoremap("<leader>nN", function() require("neotest").run.run({ strategy = "dap" }) end, "[Neotest] Debug nearest")
nnoremap("<leader>nS", function() require("neotest").run.stop() end, "[Neotest] Stop")
nnoremap("<leader>ns", function() require("neotest").summary.toggle() end, "[Neotest] Summary")
nnoremap("<leader>no", function() require("neotest").output.open({ enter = true }) end, "[Neotest] Output")

return M
