let g:lightline = {
      \ 'colorscheme': 'oNe',
      \ 'mode_map': {
      \   'n': '  ', 'i': '  ', 'R': '  ', 'v': '  ', 'V': '  ', "\<C-v>": '  ',
      \   'c': '  ', 's': '  ', 'S': '  ', "\<C-s>": '  ', 't': '  '
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'lineinfo', 'ale' ] ],
      \   'right': [ [ 'fileencoding', 'filetype', 'fugitive' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ ]
      \ },
      \ 'component': {
      \   'close': '%999X  '
      \ },
      \ 'component_function': {
      \   'mode': 'LightLineMode',
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'fileencoding': 'LightlineFileencoding',
      \   'ale': 'ALEGetStatusLine'
      \ },
      \ 'component_expand': {
      \   'lineinfo': 'LightLineLineinfo',
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' },
      \ 'tabline_separator': { 'left': '', 'right': '' },
      \ 'tabline_subseparator': { 'left': '', 'right': '' },
      \ 'enable': { 'tabline': 0 }
      \ }
" lightlineでdeviconを表示
function! MyFiletype()
  return expand('%:t') =~ 'NERD_tree' ? '' :
        \ winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype: 'no ft') : ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
function! LightLineMode()
  return expand('%:t') =~ 'NERD_tree' ? '' :
        \ lightline#mode()
endfunction
function! LightLineLineinfo()
  return expand('%:t') =~ 'NERD_tree' ? '' : '%3l:%-2v'
endfunction
function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction
" ファイルの変更状態
function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return " "
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction
" ファイルの権限
function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "" "  
  " else
  "   return "" 
  endif
endfunction
" ファイルのGitの状態
function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction
" ファイル名
function! LightLineFilename()
  return expand('%:t') =~ 'NERD_tree' ? '' :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : 'untitled') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
