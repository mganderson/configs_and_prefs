set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'altercation/vim-colors-solarized'   " solarized colorscheme
Plugin 'tmhedberg/SimpylFold'		    " code folding
Plugin 'vim-scripts/indentpython.vim'       " TAB = 4 whitespaces
Plugin 'Valloric/YouCompleteMe'		    " auto-completion
Plugin 'scrooloose/syntastic'		    " syntax check
Plugin 'nvie/vim-flake8'		    " PEP8 check
Plugin 'vim-airline/vim-airline'            " airline
Plugin 'vim-airline/vim-airline-themes'     " airline themes
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
 
" Manage split
set splitbelow
set splitright

" Split navigations
nnoremap <C-J> <C-W><C-J>    " Ctrl-j move to the split below
nnoremap <C-K> <C-W><C-K>    " Ctrl-k move to the split above
nnoremap <C-L> <C-W><C-L>    " Ctrl-l move to the split to the right
nnoremap <C-H> <C-W><C-H>    " Ctrl-h move to the split to the left

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Show docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Comply to PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

syntax on

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  " colorscheme zenburn
  set background=dark
  let g:solarized_termcolors=16
  colorscheme solarized
endif

" Define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

" Flag extraneous whitespaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF8 support
set encoding=utf-8

" Ensure autocomplete window goes away when we are done with it
let g:ycm_autoclose_preview_window_after_completion=1

" Shortcut for go-to-definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Line numbering
set nu

" Try to get airline characters displaying properly
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Let airline use powerline fonts
let g:airline_powerline_fonts = 1

" Copy to system clipboard
set clipboard=unnamedplus	" on Linux
" set clipboard=unnamed		" on Windows

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
" set laststatus=2
