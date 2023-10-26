vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use({ "xero/miasma.nvim", as = 'miasma', config = function() vim.cmd('colorscheme miasma') end })

	use({ 'nvim-treesitter/nvim-treesitter', { run = ":TSUpdate" } })
	use({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
		}
	})
	use {
		'tamton-aquib/duck.nvim',
		config = function()
			vim.keymap.set('n', '<leader>np', function() require("duck").hatch() end, {})
			vim.keymap.set('n', '<leader>sp', function() require("duck").cook() end, {})
		end
	}
end)
