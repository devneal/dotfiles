""" leader mappings
let mapleader=" "
imap jk <esc>
nmap <leader>vrc :edit $MYVIMRC<cr>

nnoremap <leader>o :tabedit<space>
nnoremap <leader>e :edit<space>
nnoremap <leader>q :quit<cr>
nnoremap <leader>x :xit<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>h :help<space>
nnoremap <leader>? yiw:help<space>'<c-r>"'<cr>

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
" This conflicts with <tab>, search #tab-hack
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

" Center search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" plugins
""" coc.nvim
nnoremap <leader>z :CocList files<cr>
nnoremap <leader>r :CocList grep<cr>

" This conflicts with <c-i>, search #tab-hack
" use <tab> and <s-tab> to navigate the completion list
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <pageup> <Plug>(coc-diagnostic-prev)
nmap <silent> <pagedown> <Plug>(coc-diagnostic-next)
