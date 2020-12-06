let g:coc_global_extensions = [
    \ 'coc-emmet',
    \ 'coc-explorer',
    \ 'coc-go',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-snippets',
    \ 'coc-solargraph',
    \ 'coc-tsserver',
    \ 'coc-yaml',
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

" For coc-explorer
nmap <silent> <C-e>      :CocCommand explorer<CR>
vmap <silent> <C-e> <Esc>:CocCommand explorer<CR>
omap <silent> <C-e>      :CocCommand explorer<CR>

