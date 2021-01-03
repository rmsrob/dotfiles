let g:startify_session_dir = '~/.vim/session'

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
          
let g:startify_bookmarks = [
            \ { 'c': '~/Repos/gitlab.com/rmsrob/dotfiles' },
            \ { 'i': '~/Repos/gitlab.com/rmsrob/bookmarks' },
            \ { 'z': '~/Repos/gitlab.com/rmsrob/markdox' },
            \ '~/Repos',
            \ '~/Code',
            \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

let g:startify_custom_header = [
        \ '                                 __              __          ',
        \ ' .----.--------.-----.----.-----|  |--.   .--.--|__.--------.',
        \ ' |   _|        |__ --|   _|  _  |  _  |   |  |  |  |        |',
        \ ' |__| |__|__|__|_____|__| |_____|_____|    \___/|__|__|__|__|',
        \]
