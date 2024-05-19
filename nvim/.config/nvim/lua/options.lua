local set = vim.opt

-- Global options
set.termguicolors = true
set.background = "dark"
set.clipboard = "unnamedplus"
set.splitright = true
set.splitbelow = true
set.smarttab = true
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.hidden = true
set.laststatus = 3

-- Window options
set.relativenumber = true
set.number = true
set.wrap = false
set.scrolloff = 0

-- Buffer options
set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.fileencoding = "utf-8"
set.fileformat = "unix"
set.list = true
set.listchars = {
  tab = "»·",
  trail = "~",
}

-- Set the leader and local ledaer keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Treat '*.h' files as C headers (not C++)
vim.g.c_syntax_for_h = true