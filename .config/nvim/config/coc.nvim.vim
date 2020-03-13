let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-solargraph',
    \ 'coc-yaml',
    \ 'coc-json',
    \ 'coc-snippets',
    \ 'coc-emmet',
    \ ]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

imap <C-l> <Plug>(coc-snippets-expand-jump)
