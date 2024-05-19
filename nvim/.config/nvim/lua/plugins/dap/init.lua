return {
  {
    "mfussenegger/nvim-dap",
    config = function ()
      require("plugins.dap.signs")
      require("plugins.dap.adapters")
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      require("plugins.dap.vtext")
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function ()
      require("plugins.dap.ui")
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-python").setup("/usr/bin/python3")
    end,
  },
}