"---------------------------------------------------------------------------
" Yamatsum's init.vim
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" Encoding:
"

" https://github.com/neovim/neovim/issues/5683
lang en_US.UTF-8

"---------------------------------------------------------------------------
" Plugin:
"

" PROVIDER CONFIGURATION
let g:loaded_python_provider = 0
let g:python3_host_prog = system('type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(cat $(pyenv root)/version | head -n 1)/bin/python" || echo -n $(which python)')
let g:node_host_prog = system('type nodenv &>/dev/null && echo -n "$(nodenv root)/versions/$(cat $(nodenv root)/version | head -n 1)/bin/neovim-node-host" || echo -n $(which node)')

let plugfile = $NVIM_ROOT.'/plugs.vim'
if filereadable(plugfile)
  exec 'source' plugfile
endif

"---------------------------------------------------------------------------
" Initialize:
"

syntax on

"---------------------------------------------------------------------------
" Search:
"

" 大文字小文字を区別しない
set ignorecase

" 大文字があるときは区別
set smartcase

" 文字列置換をインタラクティブに表示する
set inccommand=split

" カーソル位置記憶
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

"---------------------------------------------------------------------------
" Edit:
"

" スワップファイルを作成しない
set noswapfile

"---------------------------------------------------------------------------
" View:
"

" truecolor
set termguicolors

" 起動時メッセージを表示しない
set shortmess& shortmess+=I

" カラースキーマ
colorscheme onedark

" 絶対行番号表示
set number

" タブページを常に表示
set showtabline=2

" ウィンドウ画面分割を右に
set splitright

" ウィンドウ画面分割を下に
set splitbelow

set noshowcmd

"不可視文字の文字の可視化
set list
" set listchars=trail:˽·_,eol:¬
set listchars=tab:\│\ ,trail:·,eol:\ ,extends:»,precedes:«

" TABキーを押した際にスペースを入れる
set expandtab

" TABにいくつの空白を設定するか
set tabstop=2

" 自動インデントの際に用いられる各ステップの幅"
set shiftwidth=2

highlight Whitespace guifg=#424551

" 余分な空白の色
highlight ExtraWhitespace guifg=#528BFF

" デフォルトのモードステータスの非表示
set noshowmode

" ウィンドウの境界線の設定
set fillchars=vert:\ ,eob:\ ,fold:\ 

" Wrap Guide(80:warning, 120:danger)
" set textwidth=80
" set colorcolumn=+1
" let &colorcolumn="80,".join(range(120,999),",")

" 自動改行OFF
set formatoptions=q

hi TabLine guibg=#21252B

set pumblend=20

set winblend=30

set signcolumn=yes

"---------------------------------------------------------------------------
" FileType:
"

autocmd BufRead,BufNewFile Berksfile set filetype=ruby

autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

"---------------------------------------------------------------------------
" Mappings:
"

" ノーマルモードへの移行を＜Ctrl+j＞で行う
inoremap <C-j> <esc>
vnoremap <C-j> <esc>

" 選択したワードをアスタリスクで検索"
vnoremap * "zy:let @/ = @z<CR>n

" ESCを二回押すことでハイライトを消す
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" 矢印キーを禁止する
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" 矢印キーでウィンドウサイズ変更
noremap <Up> <C-w>+
noremap <Down> <C-w>-
noremap <Right> <C-w>>
noremap <Left> <C-w><

" タブ
nnoremap tt :<C-u>tabnew<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT

"<leader>]で現在のファイルをChomeで開く
nnoremap <leader>] :silent !open -a Google\ Chrome %<CR>

" reload init.vim (can't do undo)
nnoremap <leader>r :source $NVIM_ROOT/init.vim<CR>

"---------------------------------------------------------------------------
" Commands:
"

command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
  if 0 == a:0
    let l:arg = "."
  else
    let l:arg = a:1
  endif
  execute "%! jq \"" . l:arg . "\""
endfunction

" インサートから抜けるときにペーストモードを解除
autocmd InsertLeave * set nopaste

command! VimShowHlItem echo synIDattr(synID(line("."), col("."), 1), "name")

"---------------------------------------------------------------------------
" Fold:

function! MyFoldText()
  return getline(v:foldstart) . ' '
endfunction
set foldtext=MyFoldText()

"---------------------------------------------------------------------------
" Platform:
"

" クリップボード
set clipboard+=unnamedplus

" マウス
set mouse=a

"---------------------------------------------------------------------------
" Plugin Setting:
"

let configdir = $NVIM_ROOT.'/config'

for fpath in split(globpath(configdir, '*.vim'), '\n')
  exe 'source' fpath
endfor
