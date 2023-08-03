local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"cssls",
		"tsserver",
		"html",
		"tailwindcss",
		"intelephense",
		"jsonls",
		"jdtls",
		"eslint",
		"emmet_ls",
		"cssmodules_ls",
	},
})

mason_null_ls.setup({
	automatic_installation = true,
	ensure_installed = { "prettier", "stylua", "flake8", "eslint_d" },
})
