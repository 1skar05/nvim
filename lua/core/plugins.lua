local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

--use protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- My plugins here
	use("folke/tokyonight.nvim")
	use("kylechui/nvim-surround")
	use("nvim-lualine/lualine.nvim")
	--icons
	use("nvim-tree/nvim-web-devicons")
	use("mortepau/codicons.nvim")
	use("preservim/tagbar")
	use("terryma/vim-multiple-cursors")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("onsails/lspkind-nvim")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	--telescope and plugins
	use("nvim-telescope/telescope-file-browser.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	--lsp
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		run = ":MasonUpdate",
	})
	--formartting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")

	--bufferline
	use("akinsho/nvim-bufferline.lua")
	use("norcalli/nvim-colorizer.lua")

	--treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	--lspsaga
	use("glepnir/lspsaga.nvim")

	--noice
	use({
		"folke/noice.nvim",
		requires = { { "MunifTanjim/nui.nvim" }, { "rcarriga/nvim-notify" } },
	})

	--codeium an ai autocompletion
	use("Exafunction/codeium.vim")

	--add comment
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	-- Todo hightlight
	use("folke/todo-comments.nvim")

	-- gitsigns
	use("lewis6991/gitsigns.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
