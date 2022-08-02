if not pcall(require, "packer") then
  print("Please install packer and restart neovim!")

  return
end

require("options")
require("plugins")
require("keymaps")
require("colors")
require("autocmds")
