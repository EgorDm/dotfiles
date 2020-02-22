syntax on
set number relativenumber
set expandtab
set smarttab
set encoding=UTF-8

" set colorcolumn=81
call matchadd('ColorColumn', '\%81v', 100)
" toggle file finder

" Use fzf to find files, ignoring git files
nmap <C-f> :GFiles<CR>
nmap <C-l> :Line<CR>
nmap <C-a> :Ag<CR>

nmap <C-g> :GitGutterLineHighlightsToggle<CR>

" Nerd tree toggle ctrl+o
let NERDTreeShowHidden=1
nmap <C-o> :NERDTreeToggle<CR>

" Auto format
map <C-l> :Autoformat<CR>

" Scroll through buffers
nmap <C-x> :bprev<CR>
nmap <C-c> :bprev<CR>

" Search in nerdtree
nmap <F3> :NERDTreeFind<CR>
" Cargo run
map <F4> :!cargo run<CR>
" Spell check
map <F5> :setlocal spell! spelllang=en_us<CR>
" Git diff
map <F6> :Gdiff<CR>

" dragging lines
vmap <expr> <S-I> DVB_Drag('up')
vmap <expr> <S-K> DVB_Drag('down')

" enable powerline chars and the top bar
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" whitespace config
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:better_whitespace_ctermcolor = 'darkred'
let g:strip_whitespace_confirm = 0

let g:rainbow_active = 1

" LightLine
set laststatus=2
let g:lightline = {'colorscheme': 'snazzy'}
let g:airline_theme='base16_snazzy'


let g:SnazzyTransparent = 1

" Plugins
call plug#begin('~/.vim/plugged')

" Some standard bindings
Plug 'tpope/vim-sensible'
" Do you need to ask?
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Cool icons for in nerdtree
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
" Rainbow brackets
Plug 'connorholyday/vim-snazzy'
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
" Multicursor
Plug 'terryma/vim-multiple-cursors'
Plug 'lilydjwg/colorizer'
Plug 'gavinbeatty/dragvisuals.vim'
" Autoformatting code
Plug 'Chiel92/vim-autoformat'
" SudoWrite etc
Plug 'tpope/vim-eunuch'
" Configurable barline
Plug 'itchyny/lightline.vim'
" Align operators
Plug 'junegunn/vim-easy-align'

call plug#end()

" VIM TIPS
" ":Tutor" to learn vim!
" ":bd" to close a buffer
" "<0>" to go to begin of line
" "<$>" to go to end of line
" "<S-a>" to insert after line
" "<C-w>" to delete word before cursor
" "<S-V" to select lines
" "H,M,L" to go to top screen, middle screem, low screen

" PLUGIN TIPS
" TComment: select code and type "gc" to toggle commenting
" Vim-Rainbow: colours matching bracket pairs the same color
" auto-pairs: auto types the closing brackets

colorscheme snazzy
