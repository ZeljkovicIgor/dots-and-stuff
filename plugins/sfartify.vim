Plug 'mhinz/vim-startify'

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recently Opened Files']            },
      \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
      \ ]

let g:startify_session_dir = '~/.config/nvim/sessions'
let g:startify_session_persistence = 1
let g:startify_custom_header = [
\ ' _____   ______    ____      ____  ____      ______  _______',
\ '|\    \ |\     \  |    |    |    ||    |    |      \/       \',
\ ' \\    \| \     \ |    |    |    ||    |   /          /\     \',
\ '  \|    \  \     ||    |    |    ||    |  /     /\   / /\     |',
\ '   |     \  |    ||    |    |    ||    | /     /\ \_/ / /    /|',
\ '   |      \ |    ||    |    |    ||    ||     |  \|_|/ /    / |',
\ '   |    |\ \|    ||\    \  /    /||    ||     |       |    |  |',
\ '   |____||\_____/|| \ ___\/___ / ||____||\____\       |____|  /',
\ '   |    |/ \|   || \ |   ||   | / |    || |    |      |    | /',
\ '   |____|   |___|/  \|___||___|/  |____| \|____|      |____|/',
\ '     \(       )/      \(    )/      \(      \(          )/',
\]
