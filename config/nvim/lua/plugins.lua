-- Only required if you have packer in your `opt` pack
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  -- TODO: Maybe handle windows better?
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloading packer.nvim...")

  return
end

vim.cmd([[ autocmd BufWritePost plugins.lua PackerCompile ]])

return require('packer').startup {
  function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}
    
    -- Tools
    use 'airblade/vim-rooter'
    use 'mbbill/undotree'
    use 'alvan/vim-closetag'
    use 'AndrewRadev/tagalong.vim'
    use 'jiangmiao/auto-pairs'
    
    -- FZF
    use {'junegunn/fzf', run = './install --all' }     -- Fuzzy Searcher
    use {'junegunn/fzf.vim'}
    -- use 'ojroques/nvim-lspfuzzy', {'branch': 'main'}
    -- use 'stsewd/fzf-checkout.vim'
    
    use 'nvim-telescope/telescope.nvim'
    
    use 'norcalli/snippets.nvim'
    use 'sirver/UltiSnips'
    use 'honza/vim-snippets'    

    -- LSP
    use {'neovim/nvim-lspconfig', run = ':LspInstall all'}
    use 'nvim-lua/lsp-status.nvim'
    use 'tjdevries/lsp_extensions.nvim'
    use 'nvim-lua/completion-nvim'
    use 'tjdevries/nlua.nvim'
      
    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSInstall all"
    }
    
    -- Themes
    use 'christianchiarulli/nvcode-color-schemes.vim'
    -- use 'sainnhe/gruvbox-material'
    -- use 'lifepillar/vim-gruvbox8'
    -- use { 'dsznajder/vscode-es7-javascript-react-snippets', run = 'yarn install --frozen-lockfile && yarn compile' }
    use { 'styled-components/vim-styled-components', branch = 'main' }
    use 'glepnir/galaxyline.nvim'
    -- https://github.com/hoob3rt/lualine.nvim
    use 'romgrk/barbar.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'mhinz/vim-signify'
    use 'norcalli/nvim-colorizer.lua'
    use 'dpelle/vim-LanguageTool'
    use 'tpope/vim-commentary'
    
    -- Training
    use 'theprimeagen/vim-be-good'
  end
}


