-- https://github.com/lukas-reineke/dotfiles/blob/master/vim/lua/lsp.lua
local lsp = require('lspconfig')
local completion = require('completion')
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
      {complete_items = {"path"}},
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


local on_attach = function(client)
  completion.on_attach(client)

  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end

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


-- bash
lsp.bashls.setup({
  on_attach = on_attach
})

-- css
lsp.cssls.setup({
  on_attach = on_attach
})

-- general diagnostic server
lsp.diagnosticls.setup({
  on_attach = on_attach,
  filetypes={
    'markdown',
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'css',
    'scss',
    'sass'
  },
  init_options = {
    linters = {
      eslint = {
        command = './node_modules/.bin/eslint',
        rootPatterns = { '.git' },
        debounce = 100,
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json'
        },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning',
        },
      },
      stylelint = {
        command = './node_modules/.bin/stylelint',
        rootPatterns = { '.git' },
        debounce = 100,
        args = {
          '--formatter',
          'json',
          '--stdin-filename',
          '%filepath'
        },
        sourceName = 'stylelint',
        parseJson = {
          errorsRoot = '[0].warnings',
          line = 'line',
          column = 'column',
          message = '${text}',
          security = 'severity'
        },
        securities = {
          error = 'error',
          warning = 'warning'
        }
      },
      markdownlint = {
        command = 'markdownlint',
        isStderr = true,
        debounce = 100,
        args = { '--stdin' },
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = 'markdownlint',
        formatLines = 1,
        formatPattern = {
          '^.*?:\\s+(\\d+):\\s+(.*)(\\r|\\n)*$',
          {
            line = 1,
            column = -1,
            message = 2
          }
        }
      }
    },
    filetypes = {
      markdown = 'markdownlint',
      javascript = 'eslint',
      typescript = 'eslint',
      javascriptreact = 'eslint',
      typescriptreact = 'eslint',
      css = 'stylelint',
      scss = 'stylelint',
      sass = 'stylelint'
    },
    formatters = {
      prettier = {
        command = './node_modules/.bin/prettier',
        args = {
          '--stdin-filepath',
          '%filepath',
          '--single-quote',
          '--print-width 120'
        }
      }
    },
    formatFiletypes = {
      javascript = 'prettier',
      typescript = 'prettier',
      javascriptreact = 'prettier',
      typescriptreact = 'prettier'
    },
  }
})

-- html
lsp.html.setup({
  on_attach = on_attach
})

-- json
lsp.jsonls.setup({
  on_attach = on_attach
})

-- rust
lsp.rust_analyzer.setup({
  on_attach = on_attach
})

-- lua
lsp.sumneko_lua.setup({
  on_attach = on_attach
})

-- typescript
lsp.tsserver.setup({
  on_attach = on_attach
})

-- vim
lsp.vimls.setup({
  on_attach = on_attach
})


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
