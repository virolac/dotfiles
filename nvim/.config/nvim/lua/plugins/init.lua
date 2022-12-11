vim.cmd [[packadd packer.nvim]]

local function load_config(plugin)
  return string.format("require('plugins/%s')", plugin)
end

return require("packer").startup {
  function(use)
    -- Plugin manager
    use "wbthomason/packer.nvim"

    -- Colorschemes
    use "rmehri01/onenord.nvim"
    use "folke/tokyonight.nvim"

    -- Define keymaps, commands and autocommands while building a legend
    use "mrjones2014/legendary.nvim"

    -- Notification manager
    use "rcarriga/nvim-notify"

    -- Collection of Lua functions
    use "nvim-lua/plenary.nvim"

    -- Popup API
    use "nvim-lua/popup.nvim"

    -- Fuzzy finder on steroids
    use { "nvim-telescope/telescope.nvim", config = load_config("telescope") }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope-hop.nvim" }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }

    -- Easy navigation between frequently visited files
    use "ThePrimeagen/harpoon"

    -- Fancy start screen
    use {
      "goolord/alpha-nvim",
      event = "VimEnter",
      config = load_config("alpha-nvim"),
    }

    -- Bufferline with tabpage integration
    use {
      "akinsho/bufferline.nvim",
      event = "VimEnter",
      config = load_config("bufferline"),
    }

    -- Status line
    use {
      "nvim-lualine/lualine.nvim",
      config = load_config("lualine"),
    }

    -- Distraction-free coding
    use {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup {}
      end
    }

    -- Override common UI functions with default implementations
    use "stevearc/dressing.nvim"

    -- Surround text objects
    use "tpope/vim-surround"

    -- Automatically strip trailing whitespace
    use "axelf4/vim-strip-trailing-whitespace"

    -- Clipboard manager
    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end,
    }

    -- Magit clone
    use "TimUntersberger/neogit"

    -- Fast colorizer
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
    }

    -- Quickfix enhancements
    use "romainl/vim-qf"

    -- Fancy icons
    use "kyazdani42/nvim-web-devicons"
    use "yamatsum/nvim-web-nonicons"

    -- Undo visualizer
    use "mbbill/undotree"

    -- Terminals inside neovim
    use {
      "s1n7ax/nvim-terminal",
      config = function()
        require("nvim-terminal").setup()
        vim.cmd [[tnoremap <esc> <c-\><c-n>]]
      end,
    }

    -- Smart and powerful commenting
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    }

    -- Language Server Protocol
    use { "neovim/nvim-lspconfig", config = load_config("lsp") }
    use { "wbthomason/lsp-status.nvim" }
    use { "j-hui/fidget.nvim" }
    use { "nvim-lua/lsp_extensions.nvim" }
    use { "onsails/lspkind-nvim" }
    use {
      "ericpubu/lsp_codelens_extensions.nvim",
      config = function()
        require("codelens_extensions").setup()
      end,
    }

    -- Debug Adapter Protocol
    use { "mfussenegger/nvim-dap", config = load_config("dap") }
    use { "rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap" }
    use { "theHamsta/nvim-dap-virtual-text", requires = "mfussenegger/nvim-dap" }
    use { "nvim-telescope/telescope-dap.nvim", requires = "mfussenegger/nvim-dap" }
    use {
      "mfussenegger/nvim-dap-python",
      requires = "mfussenegger/nvim-dap",
      config = function()
        require("dap-python").setup("/usr/bin/python3")
      end,
    }

    -- Mason
    use {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        }
      end,
    }

    use "williamboman/mason-lspconfig.nvim"

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = load_config("treesitter"),
    }

    use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      requires = "nvim-treesitter/nvim-treesitter",
    }

    use {
      "nvim-treesitter/nvim-treesitter-refactor",
      requires = "nvim-treesitter/nvim-treesitter",
    }

    use {
      "nvim-treesitter/playground",
      requires = "nvim-treesitter/nvim-treesitter",
    }

    use {
      "nvim-treesitter/nvim-treesitter-context",
      requires = "nvim-treesitter/nvim-treesitter",
    }

    use {
      "JoosepAlviste/nvim-ts-context-commentstring",
      requires = "nvim-treesitter/nvim-treesitter",
    }

    -- Completions
    use { "hrsh7th/nvim-cmp", config = load_config("nvim-cmp") }
    use { "hrsh7th/cmp-buffer", requires = "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-path", requires = "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lua", requires = "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp", requires = "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp-document-symbol", requires = "hrsh7th/nvim-cmp" }
    use { "saadparwaiz1/cmp_luasnip", requires = "hrsh7th/nvim-cmp" }
    use { "lukas-reineke/cmp-under-comparator", requires = "hrsh7th/nvim-cmp" }

    -- Snippets
    use {
      "L3MON4D3/LuaSnip",
      after = "nvim-cmp",
      config = load_config("luasnip"),
    }

    use {
      "rafamadriz/friendly-snippets",
      after = "LuaSnip",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    }

    -- Tests
    use {
      "nvim-neotest/neotest",
      opt = true,
      wants = {
        "plenary.nvim",
        "nvim-treesitter",
        "FixCursorHold.nvim",
        "neotest-python",
        "neotest-plenary",
        "neotest-vim-test",
      },
      requires = {
        "vim-test/vim-test",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-vim-test",
      },
      module = { "neotest" },
      config = function()
        require("plugins.neotest").setup()
      end,
    }

    -- Lua documentation in vim
    use "milisims/nvim-luaref"
  end,

  config = {
    luarocks = {
      python_cmd = "python3",
    },
  },
}
