local status_ok, ts = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

ts.setup {
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disabe = {},
	},
	ensure_installed = {
		'tsx',
		'lua',
		'json',
		'css',
		'javascript',
		'jsdoc',
		'json5',
		'markdown',
		'markdown_inline'
	},
	autotag = {
		enable = true,
	},
}
