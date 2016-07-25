echo "||||||||||||||||||||"
echo "|||||||>^.^<||||||||"
echo "||||||||||||||||||||"
set number
set exrc
set secure
set incsearch
set hlsearch
set ignorecase
set smartcase

set nocompatible
filetype off

set expandtab
set shiftwidth=2
set tabstop=2
set relativenumber


"mappings
let mapleader=","
inoremap jk <esc>
map <Leader>e :%Eval<enter>
map <Leader>i mmgg=G'm<CR>
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
map <Leader>t :tabe
map <Leader>h :nohlsearch<enter>
map <Leader>v :vsplit<space>
map <Leader>ss :vertical resize -40<enter>
map <Leader>x :exec getline(".")<cr>
map <Leader>n :NERDTreeToggle<enter> :vertical resize +35<enter>h
map <Leader>mm MergeTabs() 
nnoremap <space>ev :!vim ~/.vimrc<enter>
nnoremap <space>sv :source ~/.vimrc<enter>

set nocompatible
filetype off

" set runtime path to inc vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim

"this is the call to begin the vundle plugin opperation

call vundle#begin()
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-surround'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'jpalardy/vim-slime'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized' 
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
" todo: tpope vim-fugitive plugin
Plugin 'tpope/vim-fugitive'
"Plugin 'justmao945/vim-clang'
" this plugin is from vim.org : l9
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'sjl/tslime.vim'
Plugin 'franks42/lein-repls'
Plugin 'derekwyatt/vim-scala'

call vundle#end()

filetype plugin indent on


syntax enable
set background=light
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized

let g:syntastic_check_on_open=1
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_show_diagnostics_ui = 1
set completeopt-=preview

let g:jsx_ext_required=0 " Allow JSX in normal JS files
