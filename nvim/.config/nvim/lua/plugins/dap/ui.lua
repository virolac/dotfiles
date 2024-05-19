local dap = require("dap")
local dapui = require("dapui")

dapui.setup {
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.75 },
        { id = "watches", size = 00.25 },
      },
      size = 50,
      position = "left",
    },
    {
      elements = { "repl", "console" },
      size = 15,
      position = "bottom",
    },
  },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end