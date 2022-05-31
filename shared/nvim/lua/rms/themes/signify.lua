local U = require "rms.utils"
local g = vim.g

g.signify_sign_add               = ''
g.signify_sign_delete            = ''
g.signify_sign_delete_first_line = ''
g.signify_sign_change            = ''

U.highlights({
    SignColumn 	= { bg = "NONE" },
    SignifySignAdd 	= { bg = "NONE", fg = "#00ff00", gui = "NONE" },
    SignifySignDelete 	= { bg = "NONE", fg = "#00ff00", gui = "NONE" },
    SignifySignChange 	= { bg = "NONE", fg = "#00ff00", gui = "NONE" }
})
