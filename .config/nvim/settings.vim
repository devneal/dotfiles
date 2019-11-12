""" settings
colorscheme elflord
imap jk <esc>
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
set colorcolumn=81              " highlight a column
set viminfo='1000,f1            " options for viminfo file (persistent memory)
set autoread                    " automatically update files changed outside of vim
set belloff=all                 " never ring the bell
set number                      " display line numbers
set relativenumber              " display line numbers relative to cursor
set encoding=UTF-8              " allow for devicons
set guicursor=                  " disable cursor styling
set nomodeline                  " disable modelines
syntax enable
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
