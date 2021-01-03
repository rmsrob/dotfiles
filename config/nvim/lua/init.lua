--  ___       _ _
-- |_ _|_ __ (_) |_
--  | || '_ \| | __|
--  | || | | | | |_
-- |___|_| |_|_|\__|
-- runtimepath with /lua/?.lua and /lua/?/init.lua

--local D = os.getenv('DOTFILES') or os.getenv('HOME')..'/.dotfiles'
--local o = vim.o

-- This is a magic line that will take your pain away.
--o.rtp = string.format('%s/neovim,%s', D, o.rtp)
-- https://github.com/lucax88x/configs/tree/master/dotfiles/.config/nvim/nvim

require 'plugins'
require 'settings'
require 'autocmd'
require 'mapping'

require 'themes.nvcode'
--require 'themes.barbar'
require 'themes.signify'
require 'themes.galaxystatus'
require 'plugins.fzf'
--require 'plugins.closetag' -- useless!!!
--require 'languagetool.config' ???
require 'plugins.tagalong'
require 'plugins.undotree'
require 'plugins.colorizer'
require 'plugins.treesitter'
require 'plugins.lsp'
-- require 'plugins.lsp-events'

-- require 'lsp.lsplsp'
-- require 'lsp.tlsp'


