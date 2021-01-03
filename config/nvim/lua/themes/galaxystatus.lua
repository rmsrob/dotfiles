local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
  bg = '#504945',
  yellow = '#fabd2f',
  cyan = '#00FFFF',
  dark = '#747474',
  green = '#00ff00',
  orange = '#FF8800',
  purple = '#5d4d7a',
  pink = '#f81ce6',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#0087d7',
  red = '#FF0000'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local function find_git_root()
  return require('galaxyline/provider_vcs').get_git_dir(vim.fn.expand('%:p:h'))
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local FilePath = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 50 then
    return vim.fn.expand('%')
  end
  return vim.fn.pathshorten(vim.fn.expand('%'))
end


gls.left[1] = {
  FirstElement = {
    provider = function() return '  '  end,
    highlight = {colors.bg,colors.line_bg}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {
        n = 'NORMAL',
        ce = 'NORMAL EX',
        i = 'INSERT',
        ic = 'INS-COMPLETE',
        c = 'COMMAND-LINE',
        v = 'VISUAL',
        V = 'VISUAL LINE',
        [''] = 'VISUAL BLOCK',
        [''] = 'SELECT',
        s = 'SELECT',
        S = 'SELECT',
        r = 'HIT-ENTER',
        R = 'REPLACE',
        Rv = 'VIRTUAL',
        rm = '--MORE',
        ['r?'] = ':CONFIRM',
        ['!'] = 'SHELL',
        t = 'TERMINAL',
        cv = 'EX',
        no = 'OPERATOR-PENDING'
      }
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.orange,
        ce = colors.red,
        i = colors.green,
        ic = colors.yellow,
        c = colors.red,
        v=colors.blue,
        V=colors.blue,
        [''] = colors.blue,
        [''] = colors.orange,
        s = colors.orange,
        S=colors.orange,
        r = colors.cyan,
        R = colors.purple,
        Rv = colors.purple,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!']  = colors.red,
        t = colors.red,
        cv = colors.red,
        no = colors.magenta
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return alias[vim.fn.mode()]
    end,
    highlight = {colors.red,colors.line_bg,'bold'},
  },
}
gls.left[3] = {
  Spacer = {
    provider = function() return '   ' end,
    condition = buffer_not_empty,
    highlight = {colors.line_bg,colors.line_bg},
  }
}
gls.left[4] = {
  BufferNumber = {
    provider = {'BufferIcon','BufferNumber'},
    separator = ' | ',
    condition = buffer_not_empty,
    separator_highlight = {colors.orange,colors.line_bg},
    highlight = {colors.grey,colors.line_bg}
  }
}
gls.left[5] = {
  RootPath = {
    provider = FilePath,
    separator = ' ',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.dark,colors.line_bg},
  }
}
gls.left[6] = {
  GitIcon = {
    provider = function() return '  ' end,
    --provider = function() return '  ' end,
    condition = find_git_root,
    -- condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[7] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = find_git_root,
    highlight = {colors.grey,colors.line_bg},
  }
}
gls.left[8] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green,colors.line_bg},
  }
}
gls.left[9] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.cyan,colors.line_bg},
  }
}
gls.left[10] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red,colors.line_bg},
  }
}
gls.left[11] = {
  LeftEnd = {
    provider = function() return '|' end,
    separator = ' ',
    condition = buffer_not_empty,
    separator_highlight = {colors.orange,colors.line_bg},
    highlight = {colors.orange,colors.line_bg}
  }
}
gls.left[12] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.line_bg}
  }
}
gls.left[13] = {
  Space = {
    provider = function () return ' ' end,
    separator = '',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.bg,colors.line_bg}
  }
}
gls.left[14] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.blue,colors.line_bg},
  }
}







gls.right[1]= {
  FileTypeName = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.dark,colors.line_bg},
  }
}
gls.right[2] ={
  FileIcon = {
    provider = 'FileIcon',
    separator = ' ',
    condition = buffer_not_empty,
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
  },
}
gls.right[3]= {
  FileFormat = {
    provider = {'FileFormat', 'FileEncode'},
    separator = '  ',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.dark,colors.line_bg},
  }
}
gls.right[4] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {colors.orange,colors.line_bg},
    highlight = {colors.pink,colors.line_bg},
  },
}
gls.right[5] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {colors.orange,colors.line_bg},
    highlight = {colors.pink,colors.line_bg},
  }
}
gls.right[6] = {
  FileName = {
    provider = 'FileSize',
    condition = buffer_not_empty,
    separator = ' ',
    separator_highlight = {colors.orange,colors.line_bg},
    highlight = {colors.cyan,colors.line_bg}
  }
}

gls.right[7] = {
  RightEnd = {
    provider = function() return ' ' end,
    separator = ' ',
    separator_highlight = {colors.bg,colors.line_bg},
    highlight = {colors.bg,colors.line_bg}
  }
}

