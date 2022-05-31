local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local exec = vim.api.nvim_exec

cmd("syntax enable")
-- cmd("syntax on")
-- cmd("filetype plugin on")
cmd("filetype plugin indent on")
g.python3_host_prog = '$HOME/.pyenv/versions/3.8.3/bin/python'

o.errorbells = false
o.autowrite = true
o.listchars = "eol:↲,tab:»·,nbsp:␣,trail:·,extends:→,precedes:←"
--o.showbreak = "↳  "
-- o.shada = "!,'20,<1000,@1000,s1000,h"      -- prevents truncated yanks, deletes, etc
o.hidden = true                                               -- Required to keep multiple buffers open multiple buffers  TEST
o.wrap = false                                                  -- Don't display long lines as just one line
--o.compatible = false
o.encoding = 'UTF-8'                                        -- The encoding displayed
o.fileencoding = 'UTF-8'                                  -- The encoding written to file
-- o.pumheight = 10                                          -- Makes popup menu smaller
o.ruler = true                                                    -- Show the cursor position all the time
o.cmdheight = 2                                              -- More space for displaying messages
o.mouse = "a"                                                  -- Enable your mouse
o.splitbelow = true                                          -- Horizontal splits will automatically be below
o.splitright = true                                            -- Vertical splits will automatically be to the right
o.conceallevel = 2                                            -- So that I can see `` in markdown files
--wo.concealcursor = "niv"
bo.tabstop = 2                                                  -- Insert 2 spaces for a tab
bo.softtabstop = 2
o.showtabline = 2			                                  -- Always show tabs
o.shiftwidth = 2			                                    -- Change the number of space characters inserted for indentation
o.smarttab = true                                             -- Makes tabbing smarter will realize you have 2 vs 4
bo.expandtab = true                                        -- Converts tabs to spaces
bo.smartindent = true                                      -- Makes indenting smart
bo.autoindent = true                                       -- Good auto indent
o.laststatus = 2                                                -- Always display the status line or 0 if not
wo.linebreak = true                                         -- Prevent Vim from automatically inserting line breaks
wo.number = true                                            -- Line numbers
wo.relativenumber = true
o.backup = false
o.writebackup = false
o.shortmess = "aoOtI"                                     -- Don't pass messages to |ins-completion-menu|.
-- o.shortmess = "c"                                          -- Don't pass messages to |ins-completion-menu|. TEST
wo.signcolumn = "auto"                                  -- Always show the signcolumn, otherwise it would shift the text each time
o.icon = true
o.updatetime = 50                                           -- (default is 4000 ms = 4 s) Faster completion try 50
o.timeoutlen = 500                                          -- By default timeoutlen is 1000 ms
o.clipboard = "unnamedplus"                        -- Copy paste between vim and everything else
o.incsearch = true
o.hlsearch = false
o.showmatch = false
wo.spell = false
bo.spelllang = "en_us", "fr"
o.smartcase = true
o.scrolloff = 16
bo.textwidth = 73
-- o.undodir = false
o.undofile = false
o.swapfile = false
o.ttyfast = true
o.secure = true
wo.foldmethod = "manual"
-- o.showmode = false
o.termguicolors = true
bo.lisp = true
-- bo.iskeyword = "-"
bo.formatoptions = "cro"                                -- Stop newline continution of comments
-- o.completeopt = 'menuone,noinsert,noselect'
-- o.mmp = 1300                                                 -- Maximum amount of memory (in Kbyte)
-- autochdir                                                        -- Your working directory will always be the same as your working directory
-- wo.foldcolumn = "2"                                      -- Folding abilities
-- wo.colorcolumn=80
