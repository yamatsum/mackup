if !has('nvim')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
else
  let g:deoplete#enable_at_startup = 1
endif
" 説明ウィンドウを補完決定時に閉じる
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" 説明ウィンドウを常に閉じる
set completeopt-=preview

