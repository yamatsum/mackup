let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
" ディレクトリアイコン
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '' "  
let g:DevIconsDefaultFolderOpenSymbol = '' "   
let g:WebDevIconsUnicodeDecorateFolderNodesSymlinkSymbol = ''
" ファイル別アイコン
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['swift'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = '' " 
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ts'] = 'ﯤ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rb'] = ''
" ディレクトリ別アイコン(need space)
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['dropbox'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['node_modules'] = ''

" let s:file_node_extensions = {
"       \ 'styl'     : '',
"       \ 'sass'     : '',
"       \ 'scss'     : '',
"       \ 'htm'      : '',
"       \ 'html'     : '',
"       \ 'slim'     : '',
"       \ 'ejs'      : '',
"       \ 'css'      : '',
"       \ 'less'     : '',
"       \ 'md'       : '',
"       \ 'markdown' : '',
"       \ 'rmd'      : '',
"       \ 'json'     : '',
"       \ 'js'       : '',
"       \ 'jsx'      : '',
"       \ 'rb'       : '',
"       \ 'php'      : '',
"       \ 'py'       : '',
"       \ 'pyc'      : '',
"       \ 'pyo'      : '',
"       \ 'pyd'      : '',
"       \ 'coffee'   : '',
"       \ 'mustache' : '',
"       \ 'hbs'      : '',
"       \ 'conf'     : '',
"       \ 'ini'      : '',
"       \ 'yml'      : '',
"       \ 'yaml'     : '',
"       \ 'bat'      : '',
"       \ 'jpg'      : '',
"       \ 'jpeg'     : '',
"       \ 'bmp'      : '',
"       \ 'png'      : '',
"       \ 'gif'      : '',
"       \ 'ico'      : '',
"       \ 'twig'     : '',
"       \ 'cpp'      : '',
"       \ 'c++'      : '',
"       \ 'cxx'      : '',
"       \ 'cc'       : '',
"       \ 'cp'       : '',
"       \ 'c'        : '',
"       \ 'h'        : '',
"       \ 'hpp'      : '',
"       \ 'hxx'      : '',
"       \ 'hs'       : '',
"       \ 'lhs'      : '',
"       \ 'lua'      : '',
"       \ 'java'     : '',
"       \ 'sh'       : '',
"       \ 'fish'     : '',
"       \ 'bash'     : '',
"       \ 'zsh'      : '',
"       \ 'ksh'      : '',
"       \ 'csh'      : '',
"       \ 'awk'      : '',
"       \ 'ps1'      : '',
"       \ 'ml'       : 'λ',
"       \ 'mli'      : 'λ',
"       \ 'diff'     : '',
"       \ 'db'       : '',
"       \ 'sql'      : '',
"       \ 'dump'     : '',
"       \ 'clj'      : '',
"       \ 'cljc'     : '',
"       \ 'cljs'     : '',
"       \ 'edn'      : '',
"       \ 'scala'    : '',
"       \ 'go'       : '',
"       \ 'dart'     : '',
"       \ 'xul'      : '',
"       \ 'sln'      : '',
"       \ 'suo'      : '',
"       \ 'pl'       : '',
"       \ 'pm'       : '',
"       \ 't'        : '',
"       \ 'rss'      : '',
"       \ 'f#'       : '',
"       \ 'fsscript' : '',
"       \ 'fsx'      : '',
"       \ 'fs'       : '',
"       \ 'fsi'      : '',
"       \ 'rs'       : '',
"       \ 'rlib'     : '',
"       \ 'd'        : '',
"       \ 'erl'      : '',
"       \ 'hrl'      : '',
"       \ 'vim'      : '',
"       \ 'ai'       : '',
"       \ 'psd'      : '',
"       \ 'psb'      : '',
"       \ 'ts'       : '',
"       \ 'tsx'      : '',
"       \ 'jl'       : '',
"       \ 'pp'       : ''
"       \}
"
" let s:file_node_exact_matches = {
"       \ 'exact-match-case-sensitive-1.txt' : 'X1',
"       \ 'exact-match-case-sensitive-2'     : 'X2',
"       \ 'gruntfile.coffee'                 : '',
"       \ 'gruntfile.js'                     : '',
"       \ 'gruntfile.ls'                     : '',
"       \ 'gulpfile.coffee'                  : '',
"       \ 'gulpfile.js'                      : '',
"       \ 'gulpfile.ls'                      : '',
"       \ 'dropbox'                          : '',
"       \ '.ds_store'                        : '',
"       \ '.gitconfig'                       : '',
"       \ '.gitignore'                       : '',
"       \ '.bashrc'                          : '',
"       \ '.zshrc'                           : '',
"       \ '.vimrc'                           : '',
"       \ '.bashprofile'                     : '',
"       \ 'favicon.ico'                      : '',
"       \ 'license'                          : '',
"       \ 'node_modules'                     : '',
"       \ 'react.jsx'                        : '',
"       \ 'procfile'                         : '',
"       \}
"
" let s:file_node_pattern_matches = {
"       \ '.*jquery.*\.js$'       : '',
"       \ '.*angular.*\.js$'      : '',
"       \ '.*backbone.*\.js$'     : '',
"       \ '.*require.*\.js$'      : '',
"       \ '.*materialize.*\.js$'  : '',
"       \ '.*materialize.*\.css$' : '',
"       \ '.*mootools.*\.js$'     : '',
"       \ 'Vagrantfile$'          : ''
"       \}
