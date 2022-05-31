local U = require "rms.utils"
local g = vim.g
local o = vim.o

g.nvcode_termcolors = 256
g.termguicolors = true
--vim.cmd("colorscheme gruvbox")
-- colorscheme gruvbox
-- colorscheme aurora
-- colorscheme nord
-- colorscheme nvcode
-- colorscheme onedark
-- colorscheme palenight
-- colorscheme snazzy


g.gruvbox_material_background = "hard"
g.gruvbox_material_transparent_background = 1
g.gruvbox_material_ui_contrast = 'high'
g.gruvbox_material_show_eob = 0
-- 'hard', 'medium'(default), 'soft'
vim.cmd("colorscheme gruvbox-material")



U.highlights({
    --Comment = { gui = "italic", fg = "NONE", bg = "NONE" },
    --LineNr = { bg = "NONE" },
    Normal = { bg = "NONE", fg = "NONE" },
    CursorLine = { gui = "NONE", sp = "NONE", bg = "NONE", fg = "NONE" },
    CursorLineNr = { bg = "NONE", fg = "#f81ce6" },
    Visual = { bg = "#f81ce6", fg = "#000000" },
    HighlightedyankRegion = { bg = "#f81ce6", fg = "#000000" },
    --SpellBad { cterm = "Underline", ctermfg = "NONE", ctermbg = "NONE", term = "Reverse", gui = "Undercurl", guisp = "#f81ce6", guibg = "NONE", guifg = "#f81CE6" },
    --SpellCap { cterm = "NONE", ctermfg = "NONE", ctermbg = "NONE", term = "Reverse", gui = "NONE", guisp = "cyan", guibg = "NONE", guifg = "#a59877" },
    --SpellLocal { cterm = "Underline", ctermfg = "NONE", ctermbg = "NONE", term = "Reverse", gui = "Undercurl", guisp = "red", guibg = "NONE", guifg = "#F5BFD2" },
    --SpellRare { cterm = "Underline", ctermfg = "NONE", ctermbg = "NONE", term = "Reverse", gui = "Undercurl", guisp = "green", guibg = "NONE", guifg = "#FF6100" }
})


