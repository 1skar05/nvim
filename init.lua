-- 1skar05 @ 20.7.2023
-- mapleader should be near top or at top to work
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.mouse = "a"

vim.o.termguicolors = true
-- Plugins
require("core.plugins")
require("core.plugin_config")

-- Encoding
vim.o.encoding = "UTF-8"

-- Colorscheme
vim.cmd.colorscheme 'tokyonight-moon'
