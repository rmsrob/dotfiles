require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'kanagawa',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
      },
      { 'filename', file_status = false, path = 1, icon = '' },
      {'filesize', icon = '⚙️'},
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'encoding', 'fileformat', 'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- -- Navigate directories
-- vim.cmd [[
--   function! ExploreDir() abort
--     let path = expand('<cfile>')
--     if isdirectory(path)
--       execute 'cd ' . path
--       execute 'normal! :lcd ' . fnameescape(getcwd()) . "\<cr>"
--       execute 'normal! :e .\<cr>'
--     endif
--   endfunction

--   augroup Breadcrumb
--     autocmd!
--     autocmd FileType lualine lua require('lualine').extensions.breadcrumb.setup {}
--     autocmd FileType lualine nnoremap <silent> <expr> <C-G> ExploreDir()
--   augroup END
-- ]]