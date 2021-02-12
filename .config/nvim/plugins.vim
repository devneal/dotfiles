" Automatically install vim-plug if it's not installed.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/vim-plug'
Plug 'fannheyward/coc-marketplace'

" Configure with :CocConfig
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_snippet_next = '<tab>'
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}

Plug 'honza/vim-snippets'
Plug 'liuchengxu/vista.vim'
    let g:vista_sidebar_width = 40
    let g:vista_no_mappings = 1
    autocmd FileType vista,vista_kind nnoremap <buffer> <silent> q :close<CR>
    autocmd FileType vista,vista_kind nnoremap <buffer> <silent> o :<c-u>call vista#cursor#FoldOrJump()<CR>
    autocmd FileType vista,vista_kind nnoremap <buffer> <silent> s :<c-u>call vista#Sort()<CR>
    autocmd FileType vista,vista_kind nnoremap <buffer> <silent> p :<c-u>call vista#cursor#TogglePreview()<CR>
Plug 'mhinz/vim-startify'
    let g:startify_change_to_dir = 0
Plug 'ntpeters/vim-better-whitespace'
    let g:better_whitespace_filetypes_blacklist=['clap_input']
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1
Plug 'editorconfig/editorconfig-vim'
Plug 'unblevable/quick-scope'
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ryanoasis/vim-devicons'
Plug 'justinmk/vim-sneak'
    let g:sneak#label = 1
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
    let g:floaterm_keymap_toggle = '<f1>'
    let g:floaterm_keymap_prev   = '<f2>'
    let g:floaterm_keymap_next   = '<f3>'
    let g:floaterm_keymap_kill   = '<f4>'
    let g:floaterm_keymap_new    = '<f5>'
    let g:floaterm_width         = 0.8
    let g:floaterm_height        = 0.8
Plug 'skywind3000/asynctasks.vim'
    let g:asynctasks_term_pos = "floaterm_reuse"
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asyncrun.extra'
call plug#end()
