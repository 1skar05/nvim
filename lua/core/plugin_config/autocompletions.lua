local cmp = require('cmp')
local lspkind = require('lspkind')
-- load friendly snippet
require('luasnip.loaders.from_vscode').lazy_load()


cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documenttation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-o>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ 
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}),
	}),
	snippet = {
	expand = function(arg)
		require('luasnip').lsp_expand(arg.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'nvim_lsp' },
	}),
	formatting = {
		format = lspkind.cmp_format({
			wirth_text = false,
			maxwidth = 50,
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
		})
	}
})

vim.cmd [[
	set completeopt=menuone,noinsert,noselect
	highlight! default link CmpItemKind CmpItenMenuDefault
]]
