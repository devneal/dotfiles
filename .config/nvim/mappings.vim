""" leader mappings
let mapleader=" "
imap jk <esc>

nnoremap <leader><leader> :mode<cr>
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

" navigate terminal panes
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-q> <c-\><c-n>:x<cr>
tnoremap <esc> <c-\><c-n>
nnoremap <c-q> <c-\><c-n>:x<cr>

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

" Center search results
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Navigate buffers
nnoremap <leader>, :bnext<cr>
nnoremap <leader>. :bprevious<cr>

" This conflicts with <c-i>, search #tab-hack
" use <tab> and <s-tab> to navigate the completion list
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"

" Save without sudo
cmap w!! w !sudo tee %

" Remap keys for gotos
nmap <silent> gtni :edit    $HOME/.vim/tasks.ini<cr>
nmap <silent> Gtni :tabedit $HOME/.vim/tasks.ini<cr>
nmap <silent> gvrc :edit    $HOME/.config/nvim/init.vim<cr>
nmap <silent> Gvrc :tabedit $HOME/.config/nvim/init.vim<cr>
nmap <silent> gzrc :edit    $HOME/.zshrc<cr>
nmap <silent> Gzrc :tabedit $HOME/.zshrc<cr>
nmap <silent> gbrc :edit    $HOME/.bashrc<cr>
nmap <silent> Gbrc :tabedit $HOME/.bashrc<cr>
nmap <silent> gvrc :edit    $HOME/.config/nvim/init.vim<cr>
nmap <silent> Gvrc :tabedit $HOME/.config/nvim/init.vim<cr>
nmap <silent> galc :edit    $HOME/.config/alacritty/alacritty.yml<cr>
nmap <silent> Galc :tabedit $HOME/.config/alacritty/alacritty.yml<cr>
nmap <silent> gpbc :edit    $HOME/.config/polybar/config<cr>
nmap <silent> Gpbc :tabedit $HOME/.config/polybar/config<cr>
nmap <silent> grfc :edit    $HOME/.config/rofi/config.rasi<cr>
nmap <silent> Grfc :tabedit $HOME/.config/rofi/config.rasi<cr>
nmap <silent> gsxc :edit    $HOME/.config/sxhkd/sxhkdrc<cr>
nmap <silent> Gsxc :tabedit $HOME/.config/sxhkd/sxhkdrc<cr>
nmap <silent> gbsc :edit    $HOME/.config/bspwm/bspwmrc<cr>
nmap <silent> Gbsc :tabedit $HOME/.config/bspwm/bspwmrc<cr>
nmap <silent> gtxc :edit    $HOME/.config/tmux/tmux.conf<cr>
nmap <silent> Gtxc :tabedit $HOME/.config/tmux/tmux.conf<cr>
nmap <silent> gals :edit    $HOME/.config/zsh/custom/aliases.zsh<cr>
nmap <silent> Gals :tabedit $HOME/.config/zsh/custom/aliases.zsh<cr>
nmap <silent> gstc :edit    $HOME/.config/st/config.h<cr>
nmap <silent> Gstc :tabedit $HOME/.config/st/config.h<cr>

" Use PageUp and PageDown to navigate diagnostics
nmap <silent> <pageup> <Plug>(coc-diagnostic-prev)
nmap <silent> <pagedown> <Plug>(coc-diagnostic-next)

nnoremap <silent> <leader> :WhichKey '<Space>'<cr>

autocmd! FileType python imap ,pdb import ipdb; ipdb.set_trace(context=9)<esc>

let g:which_key_map =  {}
let g:which_key_map.a = {
      \ 'name' : '+async-task' ,
      \ 't'  : [':AsyncTask test'                    , 'test'],
      \ 'r'  : [':AsyncTask render'                  , 'render'],
      \ 'e'  : [':AsyncTaskEdit'                     , 'edit'],
      \}
let g:which_key_map.c = {
      \ 'name' : '+coc' ,
      \ 'c' : [':CocConfig'                          , 'Config'],
      \ 'u' : [':CocUpdate'                          , 'Update'],
      \ 'd' : [':CocDisable'                         , 'Disable'],
      \ 'e' : [':CocEnable'                          , 'Enable'],
      \}
let g:which_key_map.c.l = {
      \ 'name' : '+coc-list' ,
      \ 'f' : [':CocList files'                      , 'files'],
      \ 'g' : [':CocList grep'                       , 'grep'],
      \ 'd' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 's' : [':CocList symbols'                    , 'symbols'],
      \ 'i' : [':CocList snippets'                   , 'snippets'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'r' : [':CocListResume'                      , 'resume'],
      \ 'n' : [':CocNext'                            , 'next'],
      \ 'p' : [':CocPrev'                            , 'previous'],
      \}
let g:which_key_map.g = {
      \ 'name' : '+goto' ,
      \ 'v'  : [':Vista focus'                       , 'vista'],
      \ 'e'  : [':CocCommand explorer --focus'       , 'explorer'],
      \}
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'd'  : ['<Plug>(coc-definition)'                    , 'definition'],
      \ 'D'  : [':call CocAction("jumpDefinition", "tabe")' , 'tabedit definition'],
      \ 'c'  : ['<Plug>(coc-codeaction)'                    , 'codeaction'],
      \ 'r'  : ['<Plug>(coc-references)'                    , 'references'],
      \ 'f'  : ['<Plug>(coc-format)'                        , 'format'],
      \ 'n'  : ['<Plug>(coc-rename)'                        , 'rename'],
      \ 'rf' : ['<Plug>(coc-refactor)'                      , 'refactor'],
      \}
let g:which_key_map.p = {
      \ 'name' : '+panel' ,
      \ 'v'  : [':Vista!!'                           , 'vista'],
      \ 'e'  : [':CocCommand explorer --toggle'      , 'explorer'],
      \}
let g:which_key_map.f = {
      \ 'name' : '+floaterm' ,
      \ 't'  : [':FloatermToggle'                    , 'toggle'],
      \ 'n'  : [':FloatermNew'                       , 'new'],
      \ 'p'  : [':FloatermNew python'                , 'python'],
      \}
call which_key#register('<Space>', "g:which_key_map")
