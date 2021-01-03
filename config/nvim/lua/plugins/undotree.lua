-- Undotree
local U = require "utils"
local g = vim.g

--if has("persistent_undo")
--  set undodir=$HOME."/.if has("persistent_undo")
--  set undodir=$HOME."/.vim/undodir"
--endif

U.map("n", "<leader>ut", ":UndotreeToggle<cr>")
