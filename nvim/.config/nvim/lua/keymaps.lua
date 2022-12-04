local legendary = require("legendary")

local function keymap(key, action, desc, mode, opts)
  mode = mode or { "n" }
  opts = opts or { noremap = true, silent = true }

  return { key, action, description = desc, mode = mode, opts = opts }
end

local function describe(key, desc, mode)
  mode = mode or { "n" }

  return { key, description = desc, mode = mode }
end

legendary.setup {
  keymaps = {
    -----------------------
    -- Window Management --
    -----------------------
    keymap("<C-h>", "<C-w>h", "Edit window to the left"),
    keymap("<C-j>", "<C-w>j", "Edit window below"),
    keymap("<C-k>", "<C-w>k", "Edit window above"),
    keymap("<C-l>", "<C-w>l", "Edit window to the right"),

    -----------------------
    -- Plugin Management --
    -----------------------
    keymap("<leader>ps", "<cmd>source ~/.config/nvim/lua/plugins/init.lua <bar> PackerSync<CR>", "Sync plugins"),

    ------------------------
    -- Session Management --
    ------------------------
    keymap("<C-t>", "<cmd>!tmux neww tmux-sessionizer<CR>", "Launch tmux-sessionizer"),

    -------------
    -- Editing --
    -------------
    keymap("<C-s>", "<cmd>update<CR>", "Save the file"),
    keymap("<C-a>", "<Esc>I", "Go to the beginning of the line", { "i" }),
    keymap("<C-e>", "<Esc>A", "Go to the end of the line", { "i" }),
    keymap("<C-d>", "<C-d>zz", "Scroll down half a page"),
    keymap("<C-u>", "<C-u>zz", "Scroll up half a page"),

    -----------
    -- Files --
    -----------
    keymap("<leader>ff", "<cmd>Telescope find_files<CR>", "Find file"),
    keymap("<leader>fr", "<cmd>Telescope oldfiles<CR>", "Recent files"),
    keymap("<leader>fg", "<cmd>Telescope live_grep<CR>", "Project grep"),
    keymap("<leader>fb", "<cmd>Telescope buffers<CR>", "Find buffer"),
    keymap("<leader>fd", "<cmd>Telescope fd<CR>", "fd"),
    keymap("<leader>fe", "<cmd>Telescope file_browser<CR>", "File browser"),

    ----------
    -- Help --
    ----------
    keymap("<leader>h", "<cmd>Telescope help_tags<CR>", "Find help"),

    ---------
    -- Git --
    ---------
    keymap("<leader>gg", "<cmd>Neogit<CR>", "Neogit"),
    keymap("<leader>gs", "<cmd>Telescope git_status<CR>", "Git status"),
    keymap("<leader>gc", "<cmd>Telescope git_commits<CR>", "Git commits"),

    -------------
    -- Harpoon --
    -------------
    keymap("<leader>ja", function()
      require("harpoon.mark").add_file()
    end, "[Harpoon] Add file"),

    keymap("<leader>jl", function()
      require("harpoon.ui").toggle_quick_menu()
    end, "[Harpoon] Show list"),

    keymap("<leader>jp", function()
      require("harpoon.ui").nav_prev()
    end, "[Harpoon] Jump to previous"),

    keymap("<leader>jn", function()
      require("harpoon.ui").nav_next()
    end, "[Harpoon] Jump to next"),

    keymap("<leader>j1", function()
      require("harpoon.ui").nav_file(1)
    end, "[Harpoon] Jump to #1"),

    keymap("<leader>j2", function()
      require("harpoon.ui").nav_file(2)
    end, "[Harpoon] Jump to #2"),

    keymap("<leader>j3", function()
      require("harpoon.ui").nav_file(3)
    end, "[Harpoon] Jump to #3"),

    keymap("<leader>j4", function()
      require("harpoon.ui").nav_file(4)
    end, "[Harpoon] Jump to #4"),

    ---------
    -- LSP --
    ---------
    describe("K", "[LSP] Show hover information"),
    describe("gd", "[LSP] Jump to the definition"),
    describe("gt", "[LSP] Jump to the type definition"),
    describe("gi", "[LSP] List all implementations"),
    describe("<leader>lf", "[LSP] Format buffer"),
    describe("<leader>lr", "[LSP] Rename symbol"),
    describe("<leader>lca", "[LSP] Select a code action"),
    describe("<leader>ldp", "[LSP] Go to previous diagnostic"),
    describe("<leader>ldn", "[LSP] Go to next diagnostic"),
    describe("<leader>ldo", "[LSP] Open diagnostics popup"),
    describe("<leader>ldl", "[LSP] Show diagnostics list"),

    ---------
    -- DAP --
    ---------
    keymap("<F1>", function()
      require("dap").step_back()
    end, "[DAP] Step back"),

    keymap("<F2>", function()
      require("dap").step_into()
    end, "[DAP] Step into"),

    keymap("<F3>", function()
      require("dap").step_over()
    end, "[DAP] Step over"),

    keymap("<F4>", function()
      require("dap").step_out()
    end, "[DAP] Step out"),

    keymap("<F5>", function()
      require("dap").continue()
    end, "[DAP] Continue"),

    keymap("<leader>db", function()
      require("dap").toggle_breakpoint()
    end, "[DAP] Toggle breakpoint"),

    keymap("<leader>dB", function()
      require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ")
    end, "[DAP] Toggle conditional breakpoint"),

    keymap("<leader>de", function()
      require("dapui").eval()
    end, "[DAP] Evaluate symbol under cursor"),

    keymap("<leader>dE", function()
      require("dapui").eval(vim.fn.input "[DAP] Expression > ")
    end, "[DAP] Evaluate expression"),

    ----------------
    -- Treesitter --
    ----------------
    keymap("<leader>ts", "<cmd>Telescope treesitter<CR>", "[TS] Show symbols"),
    describe("grr", "[TS] Rename the symbol under the cursor within the current scope"),
    describe("gnd", "[TS] Go to the definition of the symbol under the cursor"),
    describe("gnD", "[TS] List all definitions in the current file"),
    describe("[c", "[TS] Go to start of previous class"),
    describe("[f", "[TS] Go to start of previous function"),
    describe("[p", "[TS] Go to start of previous parameter"),
    describe("[C", "[TS] Go to end of previous class"),
    describe("[F", "[TS] Go to end of previous function"),
    describe("[P", "[TS] Go to end of previous parameter"),
    describe("]c", "[TS] Go to start of next class"),
    describe("]f", "[TS] Go to start of next function"),
    describe("]p", "[TS] Go to start of next parameter"),
    describe("]C", "[TS] Go to end of next class"),
    describe("]F", "[TS] Go to end of next function"),
    describe("]P", "[TS] Go to end of next parameter"),
    describe("<M-w>", "[TS] Init node/scope selection"),
    describe("<M-w>", "[TS] Increment to the next node"),
    describe("<M-S-w>", "[TS] Decrement to the previous node"),
    describe("<M-e>", "[TS] Increment to the upper scope"),
    describe("<M-p><M-e>", "[TS] Swap with previous element"),
    describe("<M-n><M-e>", "[TS] Swap with next element"),
    describe("<M-p><M-f>", "[TS] Swap with previous function"),
    describe("<M-n><M-f>", "[TS] Swap with next function"),
    describe("<M-p><M-p>", "[TS] Swap with previous parameter"),
    describe("<M-n><M-p>", "[TS] Swap with next parameter"),
    describe("<M-p><M-v>", "[TS] Swap with previous variable"),
    describe("<M-n><M-v>", "[TS] Swap with next variable"),
    describe("af", "[TS] Select a fuction", { "v" }),
    describe("if", "[TS] Select inner function", { "v" }),
    describe("ac", "[TS] Select a class", { "v" }),
    describe("ic", "[TS] Select inner class", { "v" }),
    describe("aa", "[TS] Select a parameter", { "v" }),
    describe("ia", "[TS] Select inner parameter", { "v" }),
    describe("av", "[TS] Select a variable", { "v" }),
    describe("iv", "[TS] Select inner variable", { "v" }),

    --------------
    -- Nvim-Cmp --
    --------------
    describe("<C-p>", "[Nvim-Cmp] Previous suggestion"),
    describe("<C-n>", "[Nvim-Cmp] Next suggestion"),
    describe("<C-q>", "[Nvim-Cmp] Abort the completion"),
    describe("<C-b>", "[Nvim-Cmp] Scroll the docs backward"),
    describe("<C-f>", "[Nvim-Cmp] Scroll the docs forward"),

    -------------
    -- LuaSnip --
    -------------
    describe("<C-k>", "[LuaSnip] Expand the current item or jump to the next item", { "i", "s" }),
    describe("<C-j>", "[LuaSnip] Jump to the previous item", { "i", "s" }),
    describe("<C-l>", "[LuaSnip] Change the current choice", { "i", "s" }),

    -------------
    -- Neotest --
    -------------
    keymap("<leader>na", function()
      require("neotest").run.attach()
    end, "[Neotest] Attach"),

    keymap("<leader>nf", function()
      require("neotest").run.run(vim.fn.expand("%"))
    end, "[Neotest] Run file"),

    keymap("<leader>nF", function()
      require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
    end, "[Neotest] Debug file"),

    keymap("<leader>nl", function()
      require("neotest").run.run_last()
    end, "[Neotest] Run last"),

    keymap("<leader>nL", function()
      require("neotest").run.run_last({ strategy = "dap" })
    end, "[Neotest] Debug last"),

    keymap("<leader>nn", function()
      require("neotest").run.run()
    end, "[Neotest] Run nearest"),

    keymap("<leader>nN", function()
      require("neotest").run.run({ strategy = "dap" })
    end, "[Neotest] Debug nearest"),

    keymap("<leader>nS", function()
      require("neotest").run.stop()
    end, "[Neotest] Stop"),

    keymap("<leader>ns", function()
      require("neotest").summary.toggle()
    end, "[Neotest] Summary"),

    keymap("<leader>no", function()
      require("neotest").output.open({ enter = true })
    end, "[Neotest] Output"),
  }
}
