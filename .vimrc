""" Automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" Plugins
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/defx.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'mhinz/vim-startify'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'wsdjeg/vim-fetch'
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-sandwich'
Plug 'ryanoasis/vim-devicons'
Plug 'posva/vim-vue'
call plug#end()

" ============================================================================
" COC.NVIM START
" ============================================================================
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use :C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" ============================================================================
" COC.NVIM END
" ============================================================================

" ============================================================================
" DEFX.NVIM START
" ============================================================================
" let g:loaded_netrwPlugin = 1 " Disable netrw.vim

" autocmd FileType defx call s:defx_my_settings()

augroup defxConfig
  autocmd!
  autocmd FileType defx call s:defx_my_settings()
augroup END


function! s:defx_my_settings() abort
  "Navigation
  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> l defx#do_action('drop')
  nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd', [getcwd()])

  " Open commands
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabedit')

  " Preview current file
  nnoremap <silent><buffer><expr> p defx#do_action('open', 'pedit')

  " File manipulation
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> <Del> defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy defx#do_action('copy')
  nnoremap <silent><buffer><expr> dd defx#do_action('move')
  nnoremap <silent><buffer><expr> pp defx#do_action('paste')

  " Miscellaneous actions
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yp defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> <c-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> <c-r> defx#do_action('redraw') . ':nohlsearch<cr>:syntax sync fromstart<cr><c-l>'
  nnoremap <silent><buffer><expr> <c-l> ':wincmd l<cr>'
  nnoremap <silent><buffer><expr> <c-n> ':tabprevious<cr>:file<cr>'
  nnoremap <silent><buffer><expr> <c-m> ':tabnext<cr>:file<cr>'
  nnoremap <silent><buffer><expr> <leader>t defx#do_action('quit')
  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')

  " nnoremap <silent><buffer><expr><nowait> s defx#do_action('toggle_select') . 'j'
  " nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')

  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')

endfunction

" nnoremap <silent>- :Defx `expand('%:p:h')` -show-ignored-files -search=`expand('%:p')`<CR>
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'toggle': 1,
      \ })
" ============================================================================
" DEFX.NVIM END
" ============================================================================

let g:startify_change_to_dir = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 0

let g:tagbar_sort = 0

let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let g:NERDTreeMapOpenVSplit = "v"
let g:NERDTreeMapPreviewVSplit = "gv"
let g:NERDTreeMapOpenSplit = "s"
let g:NERDTreeMapPreviewSplit = "gs"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

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
autocmd fileType json syntax match Comment +\/\/.\+$+
autocmd fileType javascript setlocal ts=2 sts=2 sw=2
autocmd BufRead,BufNewFile *.htm,*.html,*.vue setlocal tabstop=2 shiftwidth=2 softtabstop=2

" split build, vsplit build, tab build
autocmd filetype cpp nnoremap ,sb :exe "split ".expand("%:h")."/BUILD"<cr>
autocmd filetype cpp nnoremap ,vb :exe "vsplit ".expand("%:h")."/BUILD"<cr>
autocmd filetype cpp nnoremap ,tb :exe "tabedit ".expand("%:h")."/BUILD"<cr>

" split deps, vsplit deps, tab deps
autocmd filetype cpp nnoremap ,sd :let x=expand("%:t")<cr>:exe "split ".expand("%:h")."/BUILD"<cr>gg/"<c-r>=x<cr>"<cr>/deps<cr>
autocmd filetype cpp nnoremap ,vd :let x=expand("%:t")<cr>:exe "vsplit ".expand("%:h")."/BUILD"<cr>gg/"<c-r>=x<cr>"<cr>/deps<cr>
autocmd filetype cpp nnoremap ,td :let x=expand("%:t")<cr>:exe "tabedit ".expand("%:h")."/BUILD"<cr>gg/"<c-r>=x<cr>"<cr>/deps<cr>

" split header, vsplit header, tab header
autocmd filetype cpp nnoremap ,sh :exe "split ".expand("%:h")."/".expand("%:t")[:-3]."h"<cr>
autocmd filetype cpp nnoremap ,vh :exe "vsplit ".expand("%:h")."/".expand("%:t")[:-3]."h"<cr>
autocmd filetype cpp nnoremap ,th :exe "tabedit ".expand("%:h")."/".expand("%:t")[:-3]."h"<cr>

" make terminal default mode insert (false positive on restore session)
if has('nvim')
    autocmd TermOpen term://* startinsert
endif

""" plugin leader mappings
let mapleader=" "
nnoremap <leader>b :TagbarOpenAutoClose<cr>
nnoremap <leader>t :Defx<CR>
nnoremap <leader>T :Defx `expand('%:p:h')` -search=`expand('%:p')`<CR>
nnoremap <leader>z :CocList files<CR>
nnoremap <leader>r :<C-u>CocList grep<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>
" remap for rename current word
nmap <leader>cr <Plug>(coc-rename)
" remap for format selected region
xmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-format-selected)
" remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>ca <Plug>(coc-codeaction-selected)
" remap for do codeAction of current line
nmap <leader>cc <Plug>(coc-codeaction)
" fix autofix problem of current line
nmap <leader>cx <Plug>(coc-fix-current)
" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>cmd  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Search workpspace symbols
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>

""" general leader mappings
nmap <leader>vrc :edit ~/Code/dotfiles/.vimrc<cr>
" copy filename to clipboard
nnoremap <leader>cff :let @"=expand("%")<cr>     " copy file full
nnoremap <leader>cfh :let @"=expand("%:h")<cr>   " copy file head
nnoremap <leader>cft :let @"=expand("%:t")<cr>   " copy file tail

nnoremap <leader>cpf :let @"=expand("%:p")<cr>   " copy path full
nnoremap <leader>cph :let @"=expand("%:p:h")<cr> " copy path head
nnoremap <leader>cpt :let @"=expand("%:p:t")<cr> " copy path tail
nnoremap <leader>p :let @"=expand("%:p")<CR>
nnoremap <leader>o :tabedit<space>
nnoremap <leader>e :edit<space>
nnoremap <leader>h :help<space>
nnoremap <leader>? yiw:help<space>'<c-r>"'<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>x :xit<cr>
nnoremap <leader>w :write<cr>
" jump list
nnoremap <leader>. <c-i>
nnoremap <leader>, <c-o>
" create panes
nnoremap <leader>s :sp<cr>
nnoremap <leader>v :vsp<cr>
" create terminals
nnoremap <leader>st  :sp<cr>:terminal<cr>i
nnoremap <leader>vt  :vsp<cr>:terminal<cr>i
nnoremap <leader>tt  :tabedit<cr>:terminal<cr>i
nnoremap <leader>tty :terminal<cr>i
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

noremap <c-down>  <c-w>+
noremap <c-up>    <c-w>-
noremap <c-right> <c-w>>
noremap <c-left>  <c-w><
" navigate diagnostics
nmap <silent> <pageup>   <Plug>(coc-diagnostic-prev)
nmap <silent> <pagedown> <Plug>(coc-diagnostic-next)
" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gw :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

tnoremap <esc> <c-\><c-n>
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
if has('nvim')
    set guicursor=              " disable cursor styling
else
    set pyxversion=3            " use python 3 for pyx commands
endif
set nomodeline                  " disable modelines
syntax enable
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
