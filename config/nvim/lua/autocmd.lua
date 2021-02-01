local cmd = vim.cmd
local api = vim.api


-- auto source when writing to init.vm alternatively you can run :source $MYVIMRC
--cmd("au BufWritePost $MYVIMRC source %")
--cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

-- cmd("au FocusLost * :wa")
-- cmd("au FocusLost * silent! wa")

--cmd("au BufNewFile,BufRead .prettierrc setf json")
--cmd("au BufNewFile,BufRead .eslintrc setf json")
--cmd("au BufNewFile,BufRead .eslintignore setf gitignore")

-- Check spelling Turn spellcheck on for markdown files
--augroup auto_spellcheck
--  autocmd BufNewFile,BufRead *.md setlocal spell
-- augroup END
vim.cmd([[autocmd BufNewFile,BufRead *.md setlocal spell]])

--cmd("au bufnewfile,bufRead *.profile set filetype=sh")
--cmd("au bufnewfile,bufRead *.crontab set filetype=crontab")
--cmd("au bufnewfile,bufRead *ssh/config set filetype=sshconfig")
--cmd("au bufnewfile,bufRead *gitconfig set filetype=gitconfig")
--cmd("au bufnewfile,bufread /tmp/psql.edit.* set syntax=sql")

-- start at last place you were editing
--cmd("'BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif)



-- in .md files fill empty links with ddg research
--cmd("autocmd vimleavepre *.md !perl -p -i -e 's,\[([^\]]+)\]\(\),[\1](https://duck.com/lite?kae=t&q=\1),g' %")



-- Save file as sudo on files that require root permission
--cmd("cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!")

-- Trim spaces
--fun! TrimWhitespace()
--  let l:save = winsaveview()
--  keeppatterns %s/\s\+$//e
--  call winrestview(l:save)
--endfun
--autocmd BufWritePre * :call TrimWhitespace()

--vim.cmd([[autocmd TextYankPost * silent! lua require vim.highlight.on_yank({ higroup = "HighlightedyankRegion", timeout = 69 })]])
vim.cmd([[autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup = "HighlightedyankRegion", timeout = 69})]])

--augroup highlight_yank
--    autocmd!
--    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
-- augroup END


-- For highlighting yanked region
--cmd('au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "HighlightedyankRegion", timeout = 69 })')

