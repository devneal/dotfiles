" Automatically install vim-plug if it's not installed.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-plug'
Plug 'liuchengxu/vista.vim'
    let g:vista_sidebar_width = 45
Plug 'mhinz/vim-startify'
    let g:startify_change_to_dir = 0
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_snippet_next = '<tab>'
Plug 'ntpeters/vim-better-whitespace'
Plug 'psliwka/vim-smoothie'
Plug 'sdras/vue-vscode-snippets'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1
call plug#end()

