" ディレクトリ表示記号
let g:NERDTreeDirArrows = 1
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''
" let g:NERDTreeDirArrowExpandable = ' '
" let g:NERDTreeDirArrowCollapsible = ' '
" 起動時にブックマークを表示
let g:NERDTreeShowBookmarks=1
" NERDTreeを起動時に表示
" let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeWinSize=26
" 起動時にディレクトリならNERDTree、ファイルならファイルにフォーカスをあてる
let g:nerdtree_tabs_smart_startup_focus=1
" 新規タブを開いた時にもNERDTreeを表示する
let g:nerdtree_tabs_open_on_new_tab=1

let g:NERDTreeChDirMode=2
" <C-e>でNERDTreeをオンオフ
" nmap <silent> <C-e>      :NERDTreeToggle<CR>
" vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
" omap <silent> <C-e>      :NERDTreeToggle<CR>
" <C-e>でNERDTreeをオンオフ(タブ間で共有)
" nmap <silent> <C-e>      :NERDTreeTabsToggle<CR>
" vmap <silent> <C-e> <Esc>:NERDTreeTabsToggle<CR>
" omap <silent> <C-e>      :NERDTreeTabsToggle<CR>
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" 開始時の余分な説明を消す
let NERDTreeMinimalUI=1
" autocmd filetype nerdtree hi Normal guibg=#282828
let NERDTreeIgnore=[
  \ '\.DS_Store$',
  \ '\.pyc',
  \ '\~$',
  \ '\.swo$',
  \ '\.swp$',
  \ '\.git',
  \ '\.hg',
  \ '\.svn',
  \ '\.bzr'
  \ ]

" ファイル別アイコンカラー
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=red guifg=#D28445
autocmd filetype nerdtree syn match html_icon ## containedin=NERDTreeFile,html
autocmd filetype nerdtree highlight css_icon ctermbg=none ctermfg=blue guifg=#6A9FB5
autocmd filetype nerdtree syn match css_icon ## containedin=NERDTreeFile,css
autocmd filetype nerdtree highlight js_icon ctermbg=none ctermfg=yellow guifg=#90A959
autocmd filetype nerdtree syn match js_icon ## containedin=NERDTreeFile,js
autocmd filetype nerdtree highlight db_icon ctermbg=none ctermfg=yellow guifg=#F4BF75
autocmd filetype nerdtree syn match db_icon ## containedin=NERDTreeFile,db
autocmd filetype nerdtree highlight python_icon ctermbg=none ctermfg=blue guifg=#6A9FB5
autocmd filetype nerdtree syn match python_icon ## containedin=NERDTreeFile,py
autocmd filetype nerdtree highlight php_icon ctermbg=none ctermfg=cyan guifg=#6A9FB5
autocmd filetype nerdtree syn match php_icon ## containedin=NERDTreeFile,php
autocmd filetype nerdtree highlight ruby_icon ctermbg=none ctermfg=red guifg=#AC4142
autocmd filetype nerdtree syn match ruby_icon ## containedin=NERDTreeFile,rb
autocmd filetype nerdtree highlight swift_icon ctermbg=none ctermfg=magenta guifg=#75B5AA
autocmd filetype nerdtree syn match swift_icon ## containedin=NERDTreeFile,swift
autocmd filetype nerdtree highlight md_icon ctermbg=none ctermfg=magenta guifg=#AA759F
autocmd filetype nerdtree syn match md_icon ## containedin=NERDTreeFile,md
autocmd filetype nerdtree highlight sh_icon ctermbg=none ctermfg=green guifg=#90A959
autocmd filetype nerdtree syn match sh_icon ## containedin=NERDTreeFile,sh
autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=blue guifg=#8BC5E6
autocmd filetype nerdtree syn match go_icon ## containedin=NERDTreeFile
