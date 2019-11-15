""" leader mappings
let mapleader=" "
nmap <leader>vrc :edit ~/Code/dotfiles/.config/nvim/init.vim<cr>

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

" plugins
nnoremap <leader>z :Denite -start-filter file/rec<cr>
nnoremap <leader>r :Denite -start-filter grep<cr>

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

" Center search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
