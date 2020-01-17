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
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif

"---------------------------------------------------------------------------
" Edit:
"

" スワップファイルを作成しない
set noswapfile

" アンドゥファイルを作成しない
" set noundofile

" バックアップファイルを作成しない
" set nobackup

" viminfoファイルを作成しない
" set viminfo=

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

" 特殊記号の2byte割当
" set ambiwidth=double

" shiftwidth を設定することが可能に(default)
" set smarttab

" TABキーを押した際にスペースを入れる
set expandtab

" TABにいくつの空白を設定するか
set tabstop=2

" 自動インデントの際に用いられる各ステップの幅"
set shiftwidth=2

highlight Whitespace guifg=#424551

" 余分な空白の色
highlight ExtraWhitespace ctermfg=blue guifg=#61afef

" デフォルトのモードステータスの非表示
set noshowmode

" ウィンドウの境界線の設定
set fillchars=vert:\ ,eob:\ 

" Wrap Guide(80:warning, 120:danger)
set textwidth=80
set colorcolumn=+1
let &colorcolumn="80,".join(range(120,999),",")

" 自動改行OFF
set formatoptions=q

hi TabLine guibg=#21252B

set pumblend=20

set signcolumn=yes

"---------------------------------------------------------------------------
" FileType:
"

autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx

autocmd BufRead,BufNewFile Berksfile set filetype=ruby

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
noremap <Left> <C-w>>
noremap <Right> <C-w><

" F3で行番号の絶対行数/相対行数の変更"
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>

" タブ
nnoremap tt :<C-u>tabnew<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT

"<leader>]で現在のファイルをChomeで開く
nnoremap <leader>] :silent !open -a Google\ Chrome %<CR>

" reload init.vim (can't do undo)
nnoremap <leader>r :source $MYVIMRC<CR>

" open init.vim
map <leader>v :e $NVIM_ROOT/init.vim<CR>

"---------------------------------------------------------------------------
" Commands:
"

" matchit.vimの有効化
" if !exists('g:loaded_matchit')
"   runtime macros/matchit.vim
" endif

command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
  if 0 == a:0
      let l:arg = "."
  else
      let l:arg = a:1
  endif
  execute "%! jq \"" . l:arg . "\""
endfunction
command! Qj call s:Qj()
function! s:Qj() abort
  %s/\(\n\|\s\)//g
endfunction

" インサートから抜けるときにペーストモードを解除
autocmd InsertLeave * set nopaste

command! VimShowHlItem echo synIDattr(synID(line("."), col("."), 1), "name")

"---------------------------------------------------------------------------
" Fold:


"---------------------------------------------------------------------------
" Platform:
"

" クリップボード
set clipboard+=unnamedplus

" マウス
set mouse=a

"---------------------------------------------------------------------------
" Others:
"

function! ProfileCursorMove() abort
  let profile_file = expand('~/.log/vim-profile.log')
  if filereadable(profile_file)
    call delete(profile_file)
  endif

  normal! gg
  normal! zR

  execute 'profile start ' . profile_file
  profile func *
  profile file *

  augroup ProfileCursorMove
    autocmd!
    autocmd CursorHold <buffer> profile pause | q
  augroup END

  for i in range(100)
    call feedkeys('j')
  endfor
endfunction

"---------------------------------------------------------------------------
" Plugin Setting:
"

let configdir = $NVIM_ROOT.'/config'

for fpath in split(globpath(configdir, '*.vim'), '\n')
  exe 'source' fpath
endfor
