if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_dir = expand('~/.config/nvim')

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" テーマ
colorscheme elflord 
let g:airline_theme = 'angr'

" 環境設定
set noswapfile
set fenc=utf-8
set autoread
set autoindent
set history=100
set scrolloff=4
set expandtab
set tabstop=2
set shiftwidth=2
" ターミナル
tnoremap <Esc> <C-\><C-n>
augroup FollowTerm
	au!
	au TermOpen * setlocal nonumber
augroup END
" 見た目
set number
set cursorline
set showmatch
set inccommand=split
set showcmd
syntax on

" ウィンドウ間の移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" 検索
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR>
set nowrap
set ignorecase
set incsearch
set smartcase

" マウス
set mouse=a

" ThinkPad X1 Carbon でよく押し間違えるのでPageUpとPageDownを無効にしました
noremap <PageUp> <nop>
noremap <PageDown> <nop>

" キー設定
inoremap jj <Esc>

" オートセーブの設定
let g:auto_save=1
let g:auto_save_in_insert_mode=0

" NERDTreeの設定
map <C-n> :NERDTreeToggle<CR>  
