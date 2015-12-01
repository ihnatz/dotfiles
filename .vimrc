set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'tpope/vim-endwise'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/tComment'
Plugin 'bling/vim-airline'
Plugin 'osyo-manga/vim-over'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'haya14busa/incsearch.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'skalnik/vim-vroom'
Plugin 'vim-scripts/gitignore'
Plugin 'elzr/vim-json'
Plugin 'elixir-lang/vim-elixir'
Plugin 'sjl/badwolf'
call vundle#end()

filetype plugin indent on

syntax enable
set background=dark
colorscheme badwolf

set showcmd
set history=1000

set term=xterm
set t_Co=256

set tabstop=2
set shiftwidth=2
set backspace=2
set shiftround
set cursorline
set expandtab
set wildmenu
set lazyredraw

set list listchars=tab:->,trail:·

set hidden

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
"
" " Numbers
set number
set numberwidth=5

set showmatch

set smarttab
set softtabstop=2
set mouse=a
set ruler
set noswapfile
set nobackup
set ignorecase
set smartcase
set autoindent
set incsearch
set laststatus=2

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.git$', '\.DS_Store$', '\.bundle$']
let g:NERDTreeWinSize = 30
let g:nerdtree_tabs_focus_on_files = 1

set wildignore+=*/tmp/*,*/.tmp/*,*.so,*.swp,*.zip
set wildignore+=*/.git/*,*/log/*,*/coverage/*

"removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

map q: :q

iabbr bpry require'pry';binding.pry

" Open CtrlP filen in new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

set shell=/bin/zsh\ -l

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

