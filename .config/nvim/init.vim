call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'Shougo/denite.nvim'

call plug#end()

""" leader mappings
let mapleader=" "
nmap <leader>vrc :edit ~/.config/nvim/init.vim<cr>

nnoremap <leader>o :tabedit<space>
nnoremap <leader>e :edit<space>
nnoremap <leader>q :quit<cr>
nnoremap <leader>x :xit<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>h :help<space>
nnoremap <leader>? yiw:help<space>'<c-r>"'<cr>

" copy filename to clipboard
nmap <leader>cff :let @"=expand("%")<CR>     " copy file full
nmap <leader>cfh :let @"=expand("%:h")<CR>   " copy file head
nmap <leader>cft :let @"=expand("%:t")<CR>   " copy file tail
nmap <leader>cpf :let @"=expand("%:p")<CR>   " copy path full
nmap <leader>cph :let @"=expand("%:p:h")<CR> " copy path head
nmap <leader>cpt :let @"=expand("%:p:t")<CR> " copy path tail

" jump list
nnoremap <leader>. <c-i>
nnoremap <leader>, <c-o>

" create panes
nnoremap <leader>s :sp<cr>
nnoremap <leader>v :vsp<cr>

" move tabs
nnoremap <leader>n :tabmove -1<cr>
nnoremap <leader>m :tabmove +1<cr>

""" general mappings
" navigate tabs
nnoremap <c-n> :tabprevious<cr>:file<cr>
nnoremap <c-m> :tabnext<cr>:file<cr>

" navigate panes
nnoremap <c-h> :wincmd h<cr>
nnoremap <c-j> :wincmd j<cr>
nnoremap <c-k> :wincmd k<cr>
nnoremap <c-l> :wincmd l<cr>

" scroll panes
noremap <c-y> 2zh
noremap <c-u> <c-e>j
noremap <c-i> <c-y>k
noremap <c-o> 2zl

" fast window resizing with + & - keys (vertical) or ) & ( keys (vertical)
noremap + <c-w>+
noremap _ <c-w>-
noremap ) <c-w>>
noremap ( <c-w><

" create terminals
nnoremap <leader>st  :sp<cr>:terminal<cr>
nnoremap <leader>vt  :vsp<cr>:terminal<cr>
nnoremap <leader>tt  :tabedit<cr>:terminal<cr>
nnoremap <leader>tty :terminal<cr>

" tnoremap <esc> <c-\><c-n>
tnoremap jk    <c-\><c-n>
tnoremap <c-h> <c-\><c-n>:wincmd h<cr>
tnoremap <c-j> <c-\><c-n>:wincmd j<cr>
tnoremap <c-k> <c-\><c-n>:wincmd k<cr>
tnoremap <c-l> <c-\><c-n>:wincmd l<cr>
tnoremap <c-x> <c-\><c-n>:quit<cr>

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
