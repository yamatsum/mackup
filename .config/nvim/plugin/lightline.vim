let g:lightline = {
      \ 'colorscheme': 'oNe',
      \ 'mode_map': {
      \   'n': '  ', 'i': '  ', 'R': '  ', 'v': '  ', 'V': '  ', "\<C-v>": '  ',
      \   'c': '  ', 's': '  ', 'S': '  ', "\<C-s>": '  ', 't': '  '
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'lineinfo', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
      \   'right': [ [ 'fileencoding', 'filetype', 'gitbranch' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ ]
      \ },
      \ 'component': {
      \   'close': '%999X  '
      \ },
      \ 'component_function': {
      \   'mode': 'LightLineMode',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'fileencoding': 'LightlineFileencoding',
      \   'ale': 'ALEGetStatusLine',
      \   'gitbranch': 'GitBranch'
      \ },
      \ 'component_expand': {
      \   'lineinfo': 'LightLineLineinfo',
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' },
      \ 'tabline_separator': { 'left': '', 'right': '' },
      \ 'tabline_subseparator': { 'left': '', 'right': '' },
      \ 'enable': { 'tabline': 0 }
      \ }
      " \   'close': '%999X  '
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
    return " "
  elseif &modified
    return "+"
  elseif &modifiable
    return " "
  else
    return " "
  endif
endfunction
" ファイルの権限
function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "" "   
    " return "" "   
  " else
  "   return ""  
  endif
endfunction
" ファイルのGitの状態
function! GitBranch()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return expand('%:t') =~ 'NERD_tree' ? '' :
          \ branch !=# '' ? ' '.branch : ''
          " \ branch !=# '' ? ' '.branch : ''
  elseif exists("*gitbranch#name")
    let branch = gitbranch#name()
    return expand('%:t') =~ 'NERD_tree' ? '' :
          \ branch !=# '' ? ' '.branch : ''
          " \ branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction
" ファイル名
function! LightLineFilename()
  " let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let root = fnamemodify(get(b:, 'gitbranch_path'), ':h:h')
  let path = expand('%:p')

  return expand('%:t') =~ 'NERD_tree' ? '' :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? (path[:len(root)-1] ==# root ? path[len(root)+1:] : expand('%:t')) : 'untitled') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
