" Automatic installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin('~/.local/share/nvim/plugged')

" Plug '/Users/yamatsum/.ghq/github.com/yamatsum/wrap-guide.nvim'

" Intellisense engine for vim8 & neovim, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File-type sensible comments
Plug 'tomtom/tcomment_vim'

" Delete/change/add parentheses/quotes/XML-tags/much more with ease
Plug 'tpope/vim-surround'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Open URI with your favorite browser
" Plug 'tyru/open-browser.vim'

" Easy and high speed coding method
" Plug 'mattn/sonictemplate-vim'

" responsive tabline
Plug 'yami-beta/vim-responsive-tabline'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" fzf
Plug '/usr/local/opt/fzf'

" fzf-vim
Plug 'junegunn/fzf.vim'

" A Vim plugin for indent-level based motion.
Plug 'jeetsukumaran/vim-indentwise'

" Show / hide cursorline automatically
Plug 'yamatsum/vim-auto-cursorline'

" Underlines the word under the cursor
Plug 'yamatsum/vim-cursorword'

" Insert several candidates with a single key
Plug 'kana/vim-smartchr', {'on': []}

" An eye friendly plugin that fades your inactive buffers and preserves your syntax highlighting!
" Plug 'TaDaa/vimade', {'on': []}

" A tree explorer
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeTabsToggle'}

" NERDTree and tabs together
Plug 'jistr/vim-nerdtree-tabs', {'on': 'NERDTreeTabsToggle'}

" Extra syntax and highlight for nerdtree files
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': 'NERDTreeTabsToggle'}

" Changes Vim working directory to project root (identified by presence of known directory or file).
Plug 'airblade/vim-rooter', {'on': 'NERDTreeTabsToggle'}

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'
"---------------------------------------------------------------------------
" View:

" A light and configurable statusline
Plug 'itchyny/lightline.vim'

" ALE indicator for the lightline vim plugin
Plug 'maximbaz/lightline-ale'

" Provides the branch name of the current git repository
Plug 'itchyny/vim-gitbranch'

" Displaying the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Indent guides on blank lines for Neovim
Plug 'lukas-reineke/indent-blankline.nvim'

" Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'bronson/vim-trailing-whitespace'

" Adds filetype glyphs (icons) to other plugins such as NERDTree, lightline.vim
Plug 'ryanoasis/vim-devicons'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

"---------------------------------------------------------------------------
" ColorScheme:

" A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
Plug 'joshdick/onedark.vim'

"---------------------------------------------------------------------------
" HTML CSS:

" THE FASTEST NEOVIM COLORIZER
Plug 'norcalli/nvim-colorizer.lua'

" emmet for vim
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript', 'typescript', 'php']}

"---------------------------------------------------------------------------
" Javascript:

" A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
Plug 'elzr/vim-json', {'for': 'json'}

" jsonc syntax support for vim
Plug 'neoclide/jsonc.vim'

" YAJS.vim: Yet Another JavaScript Syntax for Vim
Plug 'othree/yajs.vim', {'for': ['javascript', 'javascript.jsx']}

"---------------------------------------------------------------------------
" Typescript:

" Yet Another TypeScript Syntax: The most advanced TypeScript Syntax Highlighting in Vim
Plug 'HerringtonDarkholme/yats.vim', {'for': ['typescript', 'typescriptreact']}

"---------------------------------------------------------------------------
" YAML:

"---------------------------------------------------------------------------
" Markdown:

" markdown preview plugin for (neo)vim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

"---------------------------------------------------------------------------
" UML:

" Vim plugin for preview Plantuml
Plug 'weirongxu/plantuml-previewer.vim', {'for': 'plantuml'}

" vim syntax file for plantuml
Plug 'aklt/plantuml-syntax', {'for': 'plantuml'}

call plug#end()

" Load Event
augroup load_us_insert
  autocmd!
  autocmd InsertEnter * call plug#load(
        \ 'vim-smartchr',
        \ 'emmet-vim',
        \ )| autocmd! load_us_insert
augroup END

" augroup load_us_window
"   autocmd!
"   autocmd WinEnter * call plug#load(
"         \ 'vimade',
"         \ )| autocmd! load_us_window
" augroup END
