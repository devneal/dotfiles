""" Automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" Plugins
call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'wsdjeg/vim-fetch'
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-sandwich'
Plug 'ryanoasis/vim-devicons'

" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'Shougo/deoplete.nvim'
" Plug 'lifepillar/vim-mucomplete'
" Plug 'w0rp/ale'
" Plug 'tpope/vim-surround'
call plug#end()

set rtp+=~/.fzf

let g:startify_change_to_dir = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 0

" let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
" inoremap <expr><tab>  pumvisible() ? "\<C-n>" : "\<tab>"
" inoremap <expr><s-tab>  pumvisible() ? "\<C-p>" : "\<tab>"

" let g:mucomplete#enable_auto_at_startup = 1
" let g:mucomplete#chains = {}
" if !(has('python') || has('python3'))
"   " define whatever completion chain you want, but without 'omni':
"   let g:mucomplete#chains.python = ['path', 'keyn'] 
" endif

" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_python_flake8_options = '--ignore=F405,E501'

let g:tagbar_sort = 0

let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let g:NERDTreeMapOpenVSplit = "v"
let g:NERDTreeMapPreviewVSplit = "gv"
let g:NERDTreeMapOpenSplit = "s"
let g:NERDTreeMapPreviewSplit = "gs"

""" automatic paste formatting (https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode)
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

""" autocmds
nnoremap ,, /<++><cr>c4l
imap ,, <esc>,,
autocmd BufNewFile,BufRead *.jsx set filetype=javascript
autocmd filetype python inoremap ,bp breakpoint(context=9)<esc>
autocmd filetype javascript inoremap ,imrc import React, { Component } from 'react';<cr>
autocmd filetype javascript inoremap ,cc class <++> extends Component {<cr>state = {}<cr>render() {<cr>return ( <div>hello world</div> );<cr>}<cr>}<cr><cr>export default <++>;<esc><s-v>7k:s/<++>//g<left><left>

""" plugin leader mappings
let mapleader=" "
" nnoremap <pageup>   :ALEPreviousWrap<cr>
" nnoremap <pagedown> :ALENextWrap<cr>
nnoremap <leader>t  :NERDTreeToggle<cr>
nnoremap <leader>T  :NERDTreeFind<cr>
nnoremap <leader>b  :TagbarOpenAutoClose<cr>
nnoremap <leader>z  :Files<cr>
nnoremap <leader>a  :call Fzf_dev()<cr>
nnoremap <leader>r  :Rg<space>

""" general leader mappings
" copy filename to clipboard
if has('win32')
  nmap <leader>cf :let @"=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap <leader>cp :let @"=substitute(expand("%:p"), "/", "\\", "g")<CR>
  " this will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap <leader>cp8 :let @"=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap <leader>cf :let @"=expand("%")<CR>
  nmap <leader>cp :let @"=expand("%:p")<CR>
endif
nnoremap <leader>o :tabedit<space>
nnoremap <leader>e :edit<space>
nnoremap <leader>h :help<space>
nnoremap <leader>? yiw:help<space>'<c-r>"'<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>x :xit<cr>
nnoremap <leader>w :write<cr>
" slows down splitting files
" nnoremap <leader>sv :source $MYVIMRC<cr>
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

""" settings
imap jk <esc>
set completeopt-=preview        " don't show information about selected completion in preview window
set completeopt+=menuone        " use popup menu even if there is only one match
set completeopt+=noselect       " don't select a match from the menu automatically
set shortmess+=c                " don't show completion menu messages
set tabstop=4                   " number of spaces that a <tab> in the file counts for
set shiftwidth=4                " number of spaces to use for autoindent ('cindent', >>, <<, etc.)
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
set pyxversion=3                " use python 3 for pyx commands
set nomodeline                  " disable modelines
syntax enable
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
