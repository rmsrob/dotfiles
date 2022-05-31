return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
   -- PLUGINS
    use {'hrsh7th/nvim-compe'}
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}
    use {'ojroques/nvim-lspfuzzy', requires = {
            {'junegunn/fzf'},
            {'junegunn/fzf.vim'},  -- to enable preview (optional)
          },
         }
    use {'nvim-telescope/telescope.nvim',
          requires = { {'nvim-lua/plenary.nvim'} }
        }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', config = function() require'rms.plugins.telescope' end}
    use {'glepnir/lspsaga.nvim', config = function() require'rms.plugins.saga' end}
    use {'neovim/nvim-lspconfig', config = function() require'rms.plugins.lspconfig' end, run = ':LspInstall all'}
    use {'nvim-treesitter/nvim-treesitter', config = function() require'rms.plugins.treesitter' end, run = ':TSInstall all'}
    use {'onsails/lspkind-nvim', config = function() require'rms.plugins.lspkind' end}
    use {'mhartington/formatter.nvim', config = function() require'rms.plugins.formatter' end}
    use {'numToStr/Comment.nvim', config = function() require('Comment').setup() end}


   -- THEMES
    --use {'christianchiarulli/nvcode-color-schemes.vim', config = function() require'rms.themes.nvcode' end}
    use {'sainnhe/gruvbox-material'}
    use {
      'glepnir/galaxyline.nvim', branch = 'main', config = function() require'rms.themes.galaxystatus' end,
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {'mhinz/vim-signify', config = function() require'rms.themes.signify' end}
    use {'romgrk/barbar.nvim', config = function() require'rms.themes.barbar' end}

  end)
