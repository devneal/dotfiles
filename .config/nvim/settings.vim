autocmd BufRead,BufNewFile *.htm,*.html,*.vue,*.js,*.json,*.yml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufEnter * :syntax sync fromstart
autocmd FileType vista,vista_kind nnoremap <buffer> <silent> q :close<CR>
autocmd FileType vista,vista_kind nnoremap <buffer> <silent> o :<c-u>call vista#cursor#FoldOrJump()<CR>
autocmd FileType vista,vista_kind nnoremap <buffer> <silent> s :<c-u>call vista#Sort()<CR>
autocmd FileType vista,vista_kind nnoremap <buffer> <silent> p :<c-u>call vista#cursor#TogglePreview()<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

""" settings
syntax enable
colorscheme default
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
set clipboard+=unnamedplus      " use the clipboard for all operations
set timeoutlen=500              " wait time for maps with a shared prefix
set completeopt-=preview        " don't show information about selected completion in preview window
set completeopt+=menuone        " use popup menu even if there is only one match
set completeopt+=noselect       " don't select a match from the menu automatically
set shortmess+=c                " don't show completion menu messages
set tabstop=4                   " number of spaces that a <tab> in the file counts for
set shiftwidth=4                " number of spaces to use for autoindent ('cindent', >>, <<, etc.)
set softtabstop=4               " number of spaces that a <tab> counts for while performing editing operations, like inserting a <tab> or using <bs>
set expandtab                   " use the appropriate number of spaces to insert a <tab> in insert mode
set autoindent                  " copy indent from current line when starting a new line
" set smartindent                 " perform smart indenting for c-like programs
set backspace=indent,eol,start  " allow backspacing over everything
set splitright                  " vertical splits open to the right
set splitbelow                  " horizontal splits open on the bottom
set nowrap                      " long lines are not wrapped
set wildmenu                    " graphical menu for command-line completion
set wildmode=longest:full,full  " options for command-line completion
set scrolloff=2                 " number of lines to keep above and below the cursor
set scrolljump=0                " smooth scrolling at top/bottom of page
set cursorline                  " highlight the screen line of the cursor with CursorLine hl-CursorLine
set showcmd                     " show partial command in the last line of the screen
set t_Co=256                    " number of colors
set colorcolumn=89              " highlight a column
set viminfo='1000,f1            " options for viminfo file (persistent memory)
set autoread                    " automatically update files changed outside of vim
set belloff=all                 " never ring the bell
set number                      " display line numbers
set relativenumber              " display line numbers relative to cursor
set encoding=UTF-8              " allow for devicons
set guicursor=                  " disable cursor styling
set nomodeline                  " disable modelines
set exrc                        " allow for project-specific configuration files
set secure                      " disallow :autocmd, shell, and write commands in local .nvimrc

" COC
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
