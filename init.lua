-- 1skar05 @ 20.7.2023
-- leader should be near top or at top to work
require("core.keymaps")

vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = "a"

-- Plugins
require("core.plugins")
require("core.plugin_config")
require("core.colorscheme")

-- Encoding
vim.o.encoding = "UTF-8"

-- Colorscheme

-- LSP
--vim.api.nvim_set_keymap("i", "<Tab>", "<cmd>pumvisible() ? coc#_select_confirm() : '<Tab>'<CR>", { noremap = true })

