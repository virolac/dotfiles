return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function ()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("<space>f f", "  > Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("<space>f r", "  > Recent files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("<space>f g", "  > Project grep", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("u", "  > Update plugins", "<cmd>Lazy sync<CR>"),
      dashboard.button("e", "  > New file", "<cmd>enew<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    local fortune = require("alpha.fortune")
    dashboard.section.footer.val = fortune()

    alpha.setup(dashboard.opts)

    -- Send config to alpha
    alpha.setup(dashboard.opts)
  end,
}