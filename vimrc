 set nocompatible

"	 - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'bazelbuild/vim-bazel'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'rhysd/vim-clang-format'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'wsdjeg/FlyGrep.vim'
Plug 'fatih/vim-go'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'Shougo/deoplete.nvim'
Plug 'davidhalter/jedi-vim'
" Initialize plugin system
call plug#end()

set hidden
set expandtab
set shiftwidth=3
set softtabstop=3
set number
syntax on
filetype plugin indent on

" Don't fold functions by defaults
set foldlevel=99

" Mapping selecting mappings
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
nnoremap <silent> <Leader><Leader> :Files<CR>

if has('nvim')
   let $FZF_DEFAULT_OPTS .= ' --inline-info'
   " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" Show trailing whitespace:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

function StripTrailingWhitespace()
   if !&binary && &filetype != 'diff'
      normal mz
      normal Hmy
      %s/\s\+$//e
      normal 'yz<CR>
      normal `z
   endif
endfunction

" My mappings
nnoremap <leader>space :call StripTrailingWhitespace()<CR>
nnoremap <leader>f :noautocmd lvimgrep <cword> **/*<CR>
nnoremap <silent><C-o> :GFiles<CR>
let g:Lf_ShortcutF = '<C-P>'

" Doesn't work on macOS
" set clipboard=unnamedplus

" Don't show documentation pop-up in python-model 
set completeopt=menu
let g:pymode_rope=0

" Avoids a lot of python-mode errors
let g:pymode_python = 'python3'


let g:airline_theme='luna'

let g:clang_format#code_style="google"

" Neovim
" To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

colorscheme delek
set background=dark


" Python PEP8
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

set encoding=utf-8

