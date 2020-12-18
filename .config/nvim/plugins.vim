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
    let g:vista_sidebar_width = 40
    let g:vista_no_mappings = 1
Plug 'mhinz/vim-startify'
    let g:startify_change_to_dir = 0
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Configure with :CocConfig
    let g:coc_snippet_next = '<tab>'
Plug 'ntpeters/vim-better-whitespace'
Plug 'psliwka/vim-smoothie'
Plug 'sdras/vue-vscode-snippets'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1
Plug 'editorconfig/editorconfig-vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ryanoasis/vim-devicons'
Plug 'justinmk/vim-sneak'
    let g:sneak#label = 1
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
    let g:floaterm_keymap_toggle = '<f1>'
    let g:floaterm_keymap_next   = '<f2>'
    let g:floaterm_keymap_prev   = '<f3>'
    let g:floaterm_keymap_kill   = '<f4>'
    let g:floaterm_keymap_new    = '<f5>'
    let g:floaterm_gitcommit     = 'split'
Plug 'skywind3000/asynctasks.vim'
    let g:asynctasks_term_pos = "floaterm"
Plug 'skywind3000/asyncrun.vim'
    let g:asyncrun_open = 6
    function! s:runner_proc(opts)
      let curr_bufnr = floaterm#curr()
      if has_key(a:opts, 'silent') && a:opts.silent == 1
        FloatermHide!
      endif
      let cmd = 'cd ' . shellescape(getcwd())
      call floaterm#terminal#send(curr_bufnr, [cmd])
      call floaterm#terminal#send(curr_bufnr, [a:opts.cmd])
      stopinsert
      if &filetype == 'floaterm' && g:floaterm_autoinsert
        call floaterm#util#startinsert()
      endif
    endfunction
    let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
    let g:asyncrun_runner.floaterm = function('s:runner_proc')
call plug#end()
