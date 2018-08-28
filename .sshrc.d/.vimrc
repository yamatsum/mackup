"---------------------------------------------------------------------------
" View:
"

" 256色
set t_Co=256

" 背景色
set background=dark

" truecolor
if (has("termguicolors"))
  set termguicolors
endif

" 起動時メッセージを表示しない
set shortmess& shortmess+=I

" 絶対行番号表示
set number

" タブページを常に表示
set showtabline=2

" ウィンドウ画面分割を右に
set splitright

" ウィンドウ画面分割を下に
set splitbelow

"不可視文字の文字の可視化
set list
set listchars=tab:\│\ ,trail:·,eol:\ ,extends:»,precedes:«

" TABキーを押した際にスペースを入れる
set expandtab

" TABにいくつの空白を設定するか
set tabstop=2

" 自動インデントの際に用いられる各ステップの幅"
set shiftwidth=2

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

"---------------------------------------------------------------------------
" Edit:
"
set noswapfile
