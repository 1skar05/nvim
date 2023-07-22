require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls", "cssls", "tsserver", "html", "tailwindcss", "intelephense", "jsonls", "jdtls", "eslint", "emmet_ls", "cssmodules_ls" }
})


local on_attach = function(client, bufnr)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		vim.api.nvim_command [[autogroup END]]
	end
end

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
     diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
		checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})
lspconfig.tsserver.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	filetype = {"typescript", "typescriptreact", "typescript.tsx"},
	cmd = { "typescript-language-server", "--stdio" }
}
lspconfig.cssls.setup {
	capabilities = capabilities,
}
lspconfig.cssmodules_ls.setup {
	capabilities = capabilities,
}

--config php
lspconfig.intelephense.setup{
	capabilities = capabilities,
}

--config html
lspconfig.html.setup{
	capabilities = capabilities,
}

--config tailwindcss
lspconfig.tailwindcss.setup {}
