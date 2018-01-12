set nocompatible

"	 - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
Plug 'python-mode/python-mode'
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
nnoremap <silent><C-p> :FZF<CR>

" Doesn't work on macOS
" set clipboard=unnamedplus

" Don't show documentation pop-up in python-mode
set completeopt=menu

let g:airline_theme='luna'

