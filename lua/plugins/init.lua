local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

require('packer').startup({function(use)  
-- Package manager
  use 'wbthomason/packer.nvim'

	use 'nvim-tree/nvim-web-devicons'

	use { 
		'nvim-tree/nvim-tree.lua',
		config = function()
			require('plugins.configs.nvimtree')
		end
	}

  -- lua line
	use {
		'nvim-lualine/lualine.nvim',
		config = function()
			require('plugins.configs.lualine')
		end
	}

	-- bufferline
	use {
		'akinsho/bufferline.nvim',
		tag = 'v3.*',
		config = function()
			require('plugins.configs.bufferline')
		end
	}
	
	-- delete buffer		
	use {
		'ojroques/nvim-bufdel',
		config = function()
			require('plugins.configs.delbuf')
		end
	}
	
	-- indent blankline
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('plugins.configs.indent-blankline')
		end
	}

	-- nvim tree sitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({with_sync = true})
			ts_update()
		end,
		config = function()
			require('plugins.configs.nvimtreesitter')
		end
	}
	
	-- color scheme
	use {
		'navarasu/onedark.nvim',
		config = function()
			require('plugins.configs.onedark-colorscheme')
		end
	}

--[[
	use {
		'folke/tokyonight.nvim',
		config = function()
			require('plugins.configs.tokyonight-colorscheme')
		end
	}
]]

-- =============================== Mason, LSP, and autocomplete ===============================
	use { 
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end
	}

	use {
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup()
		end
	}
	
	use {
		'neovim/nvim-lspconfig',
		config = function()
			require('plugins.configs.lspconfig')
		end
	}

	use 'rafamadriz/friendly-snippets'

	use {
		'hrsh7th/nvim-cmp',
		config = function()
			require('plugins.configs.cmp')
		end
	}

	use {
		'L3MON4D3/LuaSnip',
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
		end
	}

	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'mfussenegger/nvim-jdtls'
	-- ============================== Mason and LSP ================================
	
	use {
		'NvChad/nvterm',
		config = function()
			require('plugins.configs.nvterm')
		end
	}

	use 'nathom/filetype.nvim'
	
	use {
		'goolord/alpha-nvim',
		config = function()
			require('plugins.configs.alpha')
		end
	}

  use {
		'tiagovla/scope.nvim',
		config = function()
			require('plugins.configs.scope')
		end
	}
	
	use {
		'ellisonleao/carbon-now.nvim', 
		config = function() 
			require('plugins.configs.carbon-now')
		end
	}

	if install_plugins then
    require('packer').sync()
  end
end,
  config = {
    display = {
      open_fn = function()
				return  require('packer.util').float({border='single'})
			end,
    }
  }
}) 
