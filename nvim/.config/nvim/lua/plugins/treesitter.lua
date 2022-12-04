require("nvim-treesitter.parsers").get_parser_configs()

local swap_prev, swap_next = (function()
  local swap_objects = {
    e = "@element",
    f = "@function.outer",
    p = "@parameter.inner",
    v = "@variable",
  }

  local p, n = {}, {}
  for key, obj in pairs(swap_objects) do
    p[string.format("<M-p><M-%s>", key)] = obj
    n[string.format("<M-n><M-%s>", key)] = obj
  end

  return p, n
end)()

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "c",
    "cpp",
    "cmake",
    "go",
    "html",
    "javascript",
    "lua",
    "markdown",
    "python",
    "query",
    "rust",
    "toml",
    "tsx",
    "typescript",
  },

  highlight = {
    enable = true,
    use_languagetree = false,
    disable = { "json" },
    custom_captures = custom_captures,
  },

  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },

    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },

    navigation = {
      enable = true,
      keymaps = {
        goto_definition_lsp_fallback = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
      },
    },
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<M-w>",
      node_incremental = "<M-w>",
      node_decremental = "<M-S-w>",
      scope_incremental = "<M-e>",
    },
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      c = "// %s",
      lua = "-- %s",
    },
  },

  textobjects = {
    move = {
      enable = true,
      set_jumps = true,

      goto_previous_start = {
        ["[c"] = "@class.outer",
        ["[f"] = "@function.outer",
        ["[p"] = "@parameter.inner",
      },
      goto_previous_end = {
        ["[C"] = "@class.outer",
        ["[F"] = "@function.outer",
        ["[P"] = "@parameter.outer",
      },
      goto_next_start = {
        ["]c"] = "@class.outer",
        ["]f"] = "@function.outer",
        ["]p"] = "@parameter.inner",
      },
      goto_next_end = {
        ["]C"] = "@class.outer",
        ["]F"] = "@function.outer",
        ["]P"] = "@parameter.outer",
      },
    },

    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",

        ["av"] = "@variable.outer",
        ["iv"] = "@variable.inner",
      },
    },

    swap = {
      enable = true,
      swap_previous = swap_prev,
      swap_next = swap_next,
    },
  },

  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = true,
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
}
