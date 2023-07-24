local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then return end

bufferline.setup {
	options = {
		numbers = 'none',
		mode = 'tabs',
		close_command = 'bdelete! %d',
		right_mouse_command = 'bdelete %d',
		left_mouse_command = 'buffer %d',
		separator_style = 'slant',
		always_show_bufferline = false,
		show_buffer_clode_icon = false,
		show_close_icon = false,
		color_icons = true
	},
	highlights = {
		separator = {
			guifg = '#073642',
			guibg = '#002b36'
		},
		separator_selected = {
			guifg = '#073642'
		},
		background = {
			guifg = '#657b83',
			guibg = '#002b36'
		},
		buffer_selected = {
			guifg = '#fdf6e3',
			gui = 'bold'
		},
		fill = {
			guibg = '#073642'
		}
	}
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})

