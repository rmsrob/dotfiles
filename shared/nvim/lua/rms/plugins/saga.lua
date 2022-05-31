local U = require "rms.utils"
  
  -- LSP Saga config & keys https://github.com/glepnir/lspsaga.nvim
  local saga = require("lspsaga")
  saga.init_lsp_saga({
    code_action_icon = " ",
    definition_preview_icon = "  ",
    dianostic_header_icon = "   ",
    error_sign = " ",
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    hint_sign = "⚡",
    infor_sign = "",
    warn_sign = "",
  })
  
  U.map("n", "<Leader>cf", ":Lspsaga lsp_finder<CR>", { silent = true })
  U.map("n", "<leader>ca", ":Lspsaga code_action<CR>", { silent = true })
  U.map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", { silent = true })
  U.map("n", "<leader>ch", ":Lspsaga hover_doc<CR>", { silent = true })
  U.map("n", "<leader>ck", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', { silent = true })
  U.map("n", "<leader>cj", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { silent = true })
  U.map("n", "<leader>cs", ":Lspsaga signature_help<CR>", { silent = true })
  U.map("n", "<leader>ci", ":Lspsaga show_line_diagnostics<CR>", { silent = true })
  U.map("n", "<leader>cn", ":Lspsaga diagnostic_jump_next<CR>", { silent = true })
  U.map("n", "<leader>cp", ":Lspsaga diagnostic_jump_prev<CR>", { silent = true })
  U.map("n", "<leader>cr", ":Lspsaga rename<CR>", { silent = true })
  U.map("n", "<leader>cd", ":Lspsaga preview_definition<CR>", { silent = true })
