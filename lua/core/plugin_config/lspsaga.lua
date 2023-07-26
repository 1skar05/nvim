local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
	return
end

saga.setup({
	-- show outline
	ui = {
		border = "rounded",
	},
	symbol_in_winbar = {
		enable = false,
	},
	lightbulb = {
		enable = false,
	},
	outline = {
		layout = "float",
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<cr>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", opts)
vim.keymap.set("n", "gf", "<Cmd>Lspsaga finder<cr>", opts)
vim.keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<cr>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<cr>", {})
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<cr>", opts)
vim.keymap.set("n", "<leader>ol", "<Cmd>Lspsaga outline<cr>", opts)
vim.keymap.set("n", "<A-d>", "<Cmd>Lspsaga term_toggle<cr>", opts)
vim.keymap.set("t", "<A-d>", "<Cmd>Lspsaga term_toggle<cr>", opts)
