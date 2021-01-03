local U = require 'utils'
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd

fn.setenv("FZF_DEFAULT_OPTS", "--color=dark --reverse --keep-right --marker=+ --padding=1,1")
fn.setenv("FZF_DEFAULT_COMMAND", "fd --type f --type l --hidden --follow || git ls-files --cached --others --exclude-standard")

-- Customize fzf colors to match your color scheme
-- fzf#wrap translates this to a set of `--color` options
g.fzf_colors = {
    fg = { "fg", "Normal" },
    bg = { "bg", "Normal" },
    hl = { "fg", "red" },
    ["fg+"] = { "fg", "#ffffff" },
    ["bg+"] = { "bg", "Normal" },
    ["hl+"] = { "fg", "red" },
    info = { "bg", "Normal" },
    prompt = { "fg", "#ffffff" },
    pointer = { "fg", "#ffffff" },
    marker = { "fg", "yellow" },
    spinner = { "fg", "#ffffff" },
    header = { "bg", "Normal" }
}

-- Enable per-command history
-- - History files will be stored in the specified directory
-- - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
--   'previous-history' instead of 'down' and 'up'.
g.fzf_history_dir = "~/.local/share/fzf-history"
--g.fzf_preview_window = ['right:50%', 'ctrl-/']
g.fzf_buffers_jump = 1

g.fzf_layout = {
    up = '~90%',
    window = {
        width = 0.58,
        height = 0.58,
        yoffset = 0.5,
        xoffset = 0.5,
        --highlight = 'Todo',
        border = 'Sharp'
    },
}

cmd [[ command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, { "options": "--prompt '⯈ '"}, <bang>0) ]]

U.map("n", "<leader>FZ", "FZF<CR>")
U.map("n", "<leader>FF", ":Files<CR>")
U.map("n", "<leader>BB", ":Buffers<CR>")
U.map("n", "<leader>RG", ":Rg<CR>")

