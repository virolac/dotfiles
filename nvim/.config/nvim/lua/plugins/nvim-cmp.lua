return {
  {
    "hrsh7th/nvim-cmp",
    config = function ()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      vim.opt.shortmess:append "c"

      local has_lspkind, lspkind = pcall(require, "lspkind")
      if not has_lspkind then
        return
      end

      lspkind.init()

      local cmp = require("cmp")

      cmp.setup {
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-q>"] = cmp.mapping.abort(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<Tab>"] = cmp.config.disable,
        },

        sources = {
          { name = "nvim_lua" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "luasnip" },
          { name = "buffer", keyword_length = 5 },
        },

        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        formatting = {
          format = lspkind.cmp_format {
            with_text = true,
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[API]",
              path = "[Path]",
              luasnip = "[LuaSnip]",
            },
          },
        },

        experimental = {
          ghost_text = true,
        },
      }
    end,
  },

  { "hrsh7th/cmp-buffer", dependencies = "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-path", dependencies = "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lua", dependencies = "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp", dependencies = "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp-document-symbol", dependencies = "hrsh7th/nvim-cmp" },
  { "saadparwaiz1/cmp_luasnip", dependencies = "hrsh7th/nvim-cmp" },
  { "lukas-reineke/cmp-under-comparator", dependencies = "hrsh7th/nvim-cmp" },
}