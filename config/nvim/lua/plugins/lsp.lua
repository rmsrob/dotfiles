-- https://github.com/tomaskallup/dotfiles/blob/master/nvim/lua/lsp-config.lua
-- https://github.com/lukas-reineke/dotfiles/blob/master/vim/lua/lsp.lua
local lspconfig = require'lspconfig'
--local completion = require'completion'

-- Use ehanced LSP stuff
-- vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
-- vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
-- vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
-- vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
-- vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
-- vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
-- vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
-- vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

-- local chain_complete_list = {
--   default = {
--     {complete_items = {'lsp', 'snippet'}},
--     {complete_items = {'buffers'}},
--     {complete_items = {'path'}, triggered_only = {'/'}},
--   },
--   string = {
--     {complete_items = {'path'}, triggered_only = {'/'}},
--     {complete_items = {'buffers'}},
--   },
--   comment = {},
-- }

local completion = require'completion'
local g = vim.g
local o = vim.o

o.completeopt = 'menuone,noinsert,noselect'
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
g.completion_enable_snippet = 'UltiSnips' 
g.completion_trigger_on_delete = 1
g.completion_enable_auto_popup = 1
g.completion_enable_auto_hover = 1
g.completion_enable_auto_signature = 1
g.completion_auto_change_source = 1
vim.g.completion_chain_complete_list = {
  default = {
      {complete_items = {"lsp"}},
      {complete_items = {"snippet"}},
      {complete_items = {'buffers'}},
      {complete_items = {'path'}, triggered_only = {'/'}},
    --   {complete_items = {"path"}},
      {mode = "<c-n>"},
      {mode = "dict"}
  }
}
g.completion_customize_lsp_label = {
  Function = " [function]",
  Method = " [method]",
  Reference = " [reference]",
  Enum = " [enum]",
  Field = "ﰠ [field]",
  Keyword = " [key]",
  Variable = " [variable]",
  Folder = " [folder]",
  Snippet = " [snippet]",
  Operator = " [operator]",
  Module = " [module]",
  Text = "ﮜ[text]",
  Class = " [class]",
  Interface = " [interface]"
}
g.diagnostic_show_sign = 1
g.diagnostic_insert_delay = 0


vim.fn.sign_define("LspDiagnosticsSignError",{text = "", texthl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",{text = "", texthl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation",{text = "🛈", texthl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint",{text = "!", texthl = "LspDiagnosticsSignHint"})


-- Prepare completion
-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

local on_attach = function(client)
    completion.on_attach(client)
  
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end

  --completion.on_attach({
    --sorting="None",
    --chain_complete_list=chain_complete_list,
  --})

  -- Mappings.
--   local opts = { noremap=true, silent=true }
--   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   buf_set_keymap('n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   buf_set_keymap('n', '<space>rm', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   buf_set_keymap('n', '<space>rr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   buf_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--   buf_set_keymap('n', '<space>i', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--   --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

--   -- Set some keybinds conditional on server capabilities
--   if client.resolved_capabilities.document_formatting then
--     buf_set_keymap("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--   elseif client.resolved_capabilities.document_range_formatting then
--     buf_set_keymap("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--   end
-- end

local options = {
    noremap = true,
    silent = true
  }

vim.api.nvim_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', options)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', options)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
vim.api.nvim_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)

-- vim.cmd([[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })]])
vim.cmd([[autocmd CursorHold * lua vim.lsp.buf.hover()]])
vim.cmd([[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]])
vim.cmd([[noremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
vim.cmd([[command! Format execute 'lua vim.lsp.buf.formatting()']])
vim.cmd([[setlocal omnifunc=v:lua.vim.lsp.omnifunc]])

end

-- Tsserver setup
lspconfig.tsserver.setup{
  root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git"),
  on_attach = on_attach
}

-- bash
lspconfig.bashls.setup({
    on_attach = on_attach
  })

  -- html
  lspconfig.html.setup({
    on_attach = on_attach
  })

  -- css
  lspconfig.cssls.setup({
    on_attach = on_attach
  })

  -- JSON lsp
lspconfig.jsonls.setup {
    on_attach = on_attach,
    cmd = {"json-languageserver", "--stdio"}
  }

  -- vim
  lspconfig.vimls.setup({
    on_attach = on_attach
  })

  -- graphql
  lspconfig.graphql.setup{
    root_dir = lspconfig.util.root_pattern('.git', '.graphqlrc'),
    cmd = { "graphql-lsp", "server", "-m", "stream" },
    filetypes = { "graphql" },
    on_attach = on_attach
  }

-- Lua (sumneko) setup
local function get_lua_runtime()
    local result = {}
    for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
        local lua_path = path .. "/lua/"
        if vim.fn.isdirectory(lua_path) then
            result[lua_path] = true
        end
    end
    result[vim.fn.expand("$VIMRUNTIME/lua")] = true
    result[vim.fn.expand("/usr/share/nvim/runtime/lua")] = true
    return result
end

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = {"lua-language-server"},
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT"
      },
      completion = {
        keywordSnippet = "Disable"
      },
      diagnostics = {
        enable = true,
        globals = {
          -- Neovim
          "vim",
          -- Busted
          "describe",
          "it",
          "before_each",
          "after_each",
          "teardown",
          "pending"
        },
        workspace = {
          library = get_lua_runtime(),
          maxPreload = 1000,
          preloadFileSize = 1000
        }
      }
    }
  }
}

-- Diagnostics (eslint, etc.) setup
--[[
require'lspconfig'.diagnosticls.setup {
  root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git"),
  filetypes = {"javascript", "typescript"},
  init_options = {
    linters = {
      eslint = {
        command = "eslint_d",
        rootPatterns = {".git"},
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      },
    },
    filetypes = {
      javascript = "eslint",
      typescript = "eslint"
    }
  },
  on_attach = on_attach
}
]]

-- Formatting via efm
-- $HOME/.config/efm-langserver/config.yaml
local prettier = require "efm/prettier"
local eslint = require "efm/eslint"
--local luafmt = require "efm/luafmt"

local languages = {
  --lua = {luafmt},
  typescript = {prettier, eslint},
  javascript = {prettier, eslint},
  typescriptreact = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  yaml = {prettier},
  json = {prettier},
  html = {prettier},
  scss = {prettier},
  css = {prettier},
  markdown = {prettier},
}

lspconfig.efm.setup {
  root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git"),
  filetypes = vim.tbl_keys(languages),
  init_options = {
    documentFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true
  },
  settings = {
    languages = languages
  },
  on_attach = on_attach
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      virtual_text = {
        spacing = 4,
        prefix = "▨  "
      },
      signs = true,
      update_in_insert = true,
  }
)