local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = true

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Theme inspired by Atom
  use 'kyazdani42/nvim-web-devicons'
	use { 
				'kyazdani42/nvim-tree.lua',
				config = function()
					require('plugins.nvimtree')
				end
			}

  -- lua line
	use {
		    'nvim-lualine/lualine.nvim',
				config = function()
					require('plugins.lualine')
				end
			}

	-- bufferline
	use {
				'akinsho/bufferline.nvim',
				tag = 'v3.*',
				config = function()
					require('plugins.bufferline')
				end
			}
	
	-- delet buffer		
	use {
		    'ojroques/nvim-bufdel',
				config = function()
					require('plugins.delbuf')
				end
			}
	
	-- indent blankline
	use {
				'lukas-reineke/indent-blankline.nvim',
				config = function()
					require('plugins.indent-blankline')
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
					require('plugins.nvimtreesitter')
				end
			}

	use { 
				"ellisonleao/gruvbox.nvim",
				config = function()
					require('plugins.gruvbox')
				end
			}
	
	-- onedark colorscheme
--	use {
--				'navarasu/onedark.nvim',
--				config = function()
--					require('plugins.onedark')
--				end
--			}
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
					require('plugins.lspconfig')
				end
			}
	
	use {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/nvim-cmp',
				'L3MON4D3/LuaSnip',
				'saadparwaiz1/cmp_luasnip',
				'rafamadriz/friendly-snippets'
			}
	-- ============================== Mason and LSP ================================
	
	use {
				'NvChad/nvterm',
				config = function()
					require('plugins.nvterm')
				end,
			}

			use {
						'nathom/filetype.nvim'
					}
  if install_plugins then
    require('packer').sync()
  end
end)

-- cmp, snippet config
require('plugins.cmp')



