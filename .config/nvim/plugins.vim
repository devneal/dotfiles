call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_snippet_next = '<tab>'

Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'psliwka/vim-smoothie'
Plug 'mhinz/vim-startify'
let g:startify_change_to_dir = 0

Plug 'honza/vim-snippets'
Plug 'sdras/vue-vscode-snippets'

call plug#end()
