"---------------------------------------------------------------------------
" Yamatsum's init.vim
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" Encoding:
"

" 文字コード
" set encoding=utf-8

" rcのエンコーディング
" scriptencoding utf-8

"---------------------------------------------------------------------------
" Plugin:
"

" python(pyenv) resolve (help :CheckHealth)
let g:python_host_prog = ''
let g:python3_host_prog = system('type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(cat $(pyenv root)/version | head -n 1)/bin/python" || echo -n $(which python)')
" let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin/python") || echo -n $(which python2)')
" let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python3)/bin/python") || echo -n $(which python3)')

let plugfile = $NVIM_ROOT.'/plugs.vim'
if filereadable(plugfile)
  exec 'source' plugfile
endif

"---------------------------------------------------------------------------
" Initialize:
"

syntax on

" filetype plugin indent on

"---------------------------------------------------------------------------
" Search:
"

" 選択箇所をハイライト"
" set hlsearch

" インクリメンタルサーチを行う
" set incsearch

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

" 256色
" Note: Neovim ignores t_Co and other terminal codes.
" set t_Co=256

" 背景色
" set background=dark

" truecolor
set termguicolors

" 起動時メッセージを表示しない
set shortmess& shortmess+=I

" カラースキーマ
" (tender, atom-dark-256, material-theme, OceanicNext)
colorscheme onedark

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
" set listchars=tab:▸»-,trail:˽·_,eol:¬,extends:»,precedes:«,nbsp:%
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

" set autoindent

" set smartindent

highlight Whitespace guifg=#424551

" 余分な空白の色
highlight ExtraWhitespace ctermfg=blue guifg=#61afef

" ステータスラインを常時表示
" set laststatus=2

" デフォルトのモードステータスの非表示
set noshowmode

" 必要なときだけカーソルラインを表示
hi clear CursorLine
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')
  setlocal cursorline
  hi clear CursorLine
  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      hi CursorLine term=underline cterm=underline guibg=#2C313C
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
      hi clear CursorLine
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          hi clear CursorLine
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      hi CursorLine term=underline cterm=underline guibg=#2C313C
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END

" ウィンドウの境界線の設定
set fillchars=vert:\ ,eob:\ 
" hi! VertSplit ctermfg=235 ctermbg=235 term=NONE guifg=black

" 初期起動時の空行のチルダや改行文字の設定(NonText:eol,extends,precedes)
" hi! NonText ctermfg=234 ctermbg=234 term=NONE guifg=#282c34
" hi! EndOfBuffer gui=none guifg=#282c34 guibg=none

" Wrap Guide(80:warning, 120:danger)
set textwidth=80
set colorcolumn=+1
let &colorcolumn="80,".join(range(120,999),",")

" 自動改行OFF
set formatoptions=q

" iTerm2でtmuxを使っている時にインサートモードでのカーソルの形状をかえる
" The Vim terminal options t_SI and t_EI are ignored, like all other t_XX options.
" if $TERM_PROGRAM =~ "iTerm"
"   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" endif

" 背景半透明
" if !has('gui_running')
"     augroup seiya
"         autocmd!
"         autocmd VimEnter,ColorScheme * highlight Normal guibg=none
"         autocmd VimEnter,ColorScheme * highlight LineNr guibg=none
"         autocmd VimEnter,ColorScheme * highlight SignColumn guibg=none
"         autocmd VimEnter,ColorScheme * highlight VertSplit guibg=none
"         autocmd VimEnter,ColorScheme * highlight NonText guibg=none
"     augroup END
" endif

hi TabLine guibg=#21252B

"---------------------------------------------------------------------------
" FileType:
"

autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx

" autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
" autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

autocmd BufNewFile,BufRead Berksfile set filetype=ruby

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

" turn off paste mode
" set pastetoggle=<C-j>

"---------------------------------------------------------------------------
" Commands:
"

" delete が効かないときの設定
" set backspace=indent,eol,start

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

"---------------------------------------------------------------------------
" Fold:
"

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

" プリント時の行番号の表示、余白
set printoptions=number:y,left:5pc

" プリント時のフォント
set printfont=Ricty\ for\ Powerline\ 12

"---------------------------------------------------------------------------
" Plugin Setting:
"

let configdir = $NVIM_ROOT.'/config'

for fpath in split(globpath(configdir, '*.vim'), '\n')
  exe 'source' fpath
endfor
