local status_ok, ts = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

ts.setup {
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = {
		'tsx',
		'lua',
		'vim',
		'regex',
		'json',
		'css',
		'javascript',
		'jsdoc',
		'json5',
		'markdown',
		'markdown_inline',
		'bash',
		'html',
		'svelte',
		'vue',
		'dockerfile',
		'gitignore',
		'yaml',
	},
	autotag = {
		enable = true,
	},
}
