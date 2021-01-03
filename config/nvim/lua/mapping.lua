local U = require "utils"
local g = vim.g


-- Map <leader> to space
U.map("n", "<SPACE>", "<Nop>")
g.mapleader = " "

-- Move line up and down => Ctrl+Shift+<key>
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
U.map("n", "<C-DOWN>", ":m .+1<CR>")
U.map("n", "<C-UP>", ":m .-2<CR>")

-- F keys
U.map("n", "<F4>", ":set list!<CR>")
U.map("n", "<F5>", ":set hlsearch! hlsearch?<CR>")
U.map("n", "<F7>", ":set spell!<CR>")

-- Disable Arrow keys in Escape mode ???
U.map("x", "<up>", "<nop>")
U.map("x", "<down>", "<nop>")
U.map("x", "<left>", "<nop>")
U.map("x", "<right>", "<nop>")

-- Return normal mod when ALT+hjkl
U.map("i", "<C-h>", "<C-w>h")
U.map("i", "<C-j>", "<C-w>j")
U.map("i", "<C-k>", "<C-w>k")
U.map("i", "<C-l>", "<C-w>l")

-- Yank or die
U.map("n", "<leader>y", "+y")
U.map("v", "<leader>y", "+y")
U.map("n", "<leader>Y", 'gg"+yG')

-- Nice paste
U.map("v", "<leader>p", '"_dP')

-- TAB in general mode will move to text buffer
U.map("n","<silent> <TAB>", ":bnext<CR>")
-- SHIFT-TAB will go back
U.map("n", "<silent> <S-TAB>", ":bprevious<CR>")

-- Move selected line / block of text in visual mode
U.map("v", "J", ":m '>+1<CR>gv=gv")
U.map("v", "K", ":m '<-2<CR>gv=gv")

-- Alternate way to save (exit normal/insert/visual mod and save)!!!!!
U.map("n", "<C-x>", ":w<CR>")
U.map("i", "<C-x>", "<C-o>:w<CR><Esc>")
U.map("x", "<C-x>", "<Esc>:w<CR>")

-- <TAB>: completion.
--U.map("i", "<silent> <expr><TAB>", 'pumvisible() ? "\<C-n>" : "\<TAB>"')

-- Better window navigation
U.map("n", "<C-h>", "<C-w>h")
U.map("n", "<C-j>", "<C-w>j")
U.map("n", "<C-k>", "<C-w>k")
U.map("n", "<C-l>", "<C-w>l")

-- Alternative way to insert date
U.map("n", "<leader>da", '"=strftime("%a %d %b %Y")<CR>P')
U.map("n", "<leader>dz", '"=strftime("%FT%T%z")<CR>P')

-- Show cusrsorline
U.map("n", "<leader>h", ":set cursorline!<CR>")
U.map("n", "<leader>H", ":set cursorline! cursorcolumn!<CR>")

-- Creating code blocks in Markdownfiles
U.map("n", "<leader>mk", "<cr>i```bash<cr>```<Esc>O")

-- Terminal window navigation
-- Use alt + hjkl to resize windows
-- Better nav for omnicomplete
