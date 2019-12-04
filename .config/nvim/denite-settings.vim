autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <cr>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <c-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <c-s>
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> <c-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <space>
  \ denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> <esc>
  \ denite#do_map('quit')
endfunction

call denite#custom#option('default', { 'prompt': '❯' })

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <cr> <Plug>(denite_filter_quit)<cr>
  imap <silent><buffer> <esc> <Plug>(denite_filter_quit)
  imap <silent><buffer> <c-o> <Plug>(denite_filter_quit)
  imap <silent><buffer> <c-t> <Plug>(denite_filter_quit)<c-t>
  imap <silent><buffer> <c-v> <Plug>(denite_filter_quit)<c-v>
  imap <silent><buffer> <c-s> <Plug>(denite_filter_quit)<c-s>
  inoremap <silent><buffer> <c-j>
  \ <esc><c-w>p:call cursor(line('.')+1,0)<cr><c-w>pA
  inoremap <silent><buffer> <c-k>
  \ <esc><c-w>p:call cursor(line('.')-1,0)<cr><c-w>pA
endfunction

" Change file/rec command to ripgrep
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git'])

" Change matchers.
call denite#custom#source('file/rec', 'matchers', ['matcher/fuzzy'])

" Change sorters.
call denite#custom#source(
\ 'file/rec', 'sorters', ['sorter/sublime'])

" Change default action.
call denite#custom#kind('file', 'default_action', 'open')

" Add custom menus
let s:menus = {}

let s:menus.zsh = {
    \ 'description': 'Edit your import zsh configuration'
    \ }
let s:menus.zsh.file_candidates = [
    \ ['zshrc', '~/.config/zsh/.zshrc'],
    \ ['zshenv', '~/.zshenv'],
    \ ]

let s:menus.my_commands = {
    \ 'description': 'Example commands'
    \ }
let s:menus.my_commands.command_candidates = [
    \ ['Split the window', 'vnew'],
    \ ['Open zsh menu', 'Denite menu:zsh'],
    \ ['Format code', 'FormatCode', 'go,python'],
    \ ]

call denite#custom#var('menu', 'menus', s:menus)

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Specify multiple paths in grep source
"call denite#start([{'name': 'grep',
"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#var('file/rec/py', 'command',
\ ['scantree.py', '--path', ':directory'])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" Custom action
" Note: lambda function is not supported in Vim8.
call denite#custom#action('file', 'test',
      \ {context -> execute('let g:foo = 1')})
call denite#custom#action('file', 'test2',
      \ {context -> denite#do_action(
      \  context, 'open', context['targets'])})
