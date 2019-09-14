let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'go': ['golangci-lint'],
      \ }
let g:ale_fixers = {
      \ 'typescript': ['prettier'],
      \ 'json': ['prettier'],
      \ 'go': ['gofmt', 'goimports'],
      \ }

let g:ale_fix_on_save = 1
" let g:ale_sign_column_always = 1
let g:ale_sign_error = '' "●
let g:ale_sign_warning = '' "●
" highlight ALEWarningSign guifg=#e5c07b
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" let g:ale_statusline_format = [' %d', ' %d', '']
let g:ale_echo_msg_error_str = 'E' " E 
let g:ale_echo_msg_warning_str = 'W' " W 
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = ' ' "
highlight ALEVirtualTextError guifg=#e06c75
highlight ALEVirtualTextWarning guifg=#e5c07b

let g:ale_sign_highlight_linenrs = 1
highlight ALEWarningSign guifg=#282c34
highlight ALEErrorSign guifg=#282c34
highlight ALEErrorSignLineNr guifg=#ee797b guibg=#48373e gui=bold
highlight ALEWarningSignLineNr guifg=#d9bb81 guibg=#4d4a42 gui=bold
highlight ALEInfoSignLineNr guifg=#a0be82 guibg=#404942 gui=bold
