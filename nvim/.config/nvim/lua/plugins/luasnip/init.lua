return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = "nvim-cmp",
    config = function ()
      local ls = require("luasnip")

      local function get_custom_snippets()
        local nvim_config = vim.fn.stdpath("config")
        local snippets_path = "luasnip/snippets/"

        return string.format("%s/lua/plugins/%s", nvim_config, snippets_path)
      end

      ls.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      }

      vim.keymap.set({ "i", "s" }, "<c-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<c-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<c-l>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })

      require("luasnip.loaders.from_lua").lazy_load({ paths = get_custom_snippets() })
    end,
  },

  {
    "rafamadriz/friendly-snippets",
    dependencies = "LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}