let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'typescriptreact': ['eslint'],
      \ 'go': ['golangci-lint'],
      \ }
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'typescriptreact': ['prettier'],
      \ 'json': ['prettier'],
      \ 'go': ['gofmt', 'goimports'],
      \ }

let g:ale_fix_on_save = 1
" let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
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
" guibg transparency 80%
" https://github.com/atom/autocomplete-plus/blob/1cd5c49fce80ad28accff2c9707a6e47d9b2d602/styles/autocomplete.less#L220-L221
highlight ALEErrorSignLineNr guifg=#E06C75 guibg=#4D3840 gui=bold
highlight ALEWarningSignLineNr guifg=#E5C07B guibg=#4E4942 gui=bold
highlight ALEInfoSignLineNr guifg=#98C379 guibg=#3E4941 gui=bold
" blue #344559
" magenta #483A55
" cyan #334650
