set nocompatible
set completeopt-=preview
filetype off

set guifont=Source\ Code\ Pro:h18
set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'tpope/vim-rails'
Plugin 'haya14busa/incsearch.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'skalnik/vim-vroom'
Plugin 'vim-scripts/gitignore'
Plugin 'elzr/vim-json'
Plugin 'AndrewRadev/deleft.vim'
call vundle#end()

filetype plugin indent on

syntax enable
set background=dark
colorscheme Tomorrow-Night

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

set list listchars=tab:>-,trail:·

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

set shell=/bin/zsh\ -l

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Map cursor for insert mode
let &t_SI .= "\<Esc>[5 q"
" solid block
let &t_EI .= "\<Esc>[2 q"
" 1 or 0 -> blinking block
" 3 -> blinking underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec --drb {spec}"
let g:rspec_runner = "os_x_iterm2"

set term=xterm-256color

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set noshowmatch         " Don't match parentheses/brackets
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML
