let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'go': ['gometalinter'],
      \ }
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['prettier'],
      \ 'go': ['gofmt', 'goimports'],
      \ }
let g:ale_go_gometalinter_options = '--fast --enable=golint'
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '' "●
let g:ale_sign_warning = '' "●
highlight ALEWarningSign guifg=#e5c07b
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_statusline_format = [' %d', ' %d', '']
let g:ale_echo_msg_error_str = 'E' " E 
let g:ale_echo_msg_warning_str = 'W' " W 
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" highlight ALEErrorSign guibg=none guifg=#f43753
" highlight ALEWarningSign guibg=none guifg=#ffc24b
