-- leader is space
-- syntax is 1st: mode, 2nd: what is pressed, 3rd: execute this
-- example: while in normal mode, press <control>x then execute vim.cmd.Ex
vim.keymap.set("n", "<C-x>", vim.cmd.Ex)

-- move up/:down selceted block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- bring line under to the end of cursor line
vim.keymap.set("n", "J", "mzJ`z")

-- move 1/2 screen size while always center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copies/past/delet
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- get out
vim.keymap.set("i", "<C-c>", "<Esc>")

-- format pretty code
vim.keymap.set("n", "<C-w>", function()
    vim.lsp.buf.format()
end)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search regex word under curssor
vim.keymap.set("n", "<C-s>", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- canceled
vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-tx>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })