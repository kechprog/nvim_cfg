-- Options configuration
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

vim.laststatus = 0

-- Disable wrapping
opt.wrap = true

-- Enable true color support for better syntax highlighting
opt.termguicolors = true

-- Set conceal level for plugins like markview.nvim to hide markdown syntax
opt.conceallevel = 2
