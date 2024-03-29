local lsp = require("lsp-zero")

lsp.preset("recommended")

-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
lsp.ensure_installed({
  'bashls',
  'dockerls',
  'elixirls',
  'eslint',
  'gopls',
  'graphql',
  'jedi_language_server',
  'rust_analyzer',
  'sumneko_lua',
  'solang',
  'tsserver',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-j>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-k>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '💡',
    info = ''
  }
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- watch diagnostic & move around them
  vim.keymap.set("n", "<leader>n", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "nk", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "nj", function() vim.diagnostic.goto_prev() end, opts)
  -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
  
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.hover(nil, {focus=false})]]
  
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)

  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)

  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()


-- ray-x/go.nvim

-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

require('go').setup()
