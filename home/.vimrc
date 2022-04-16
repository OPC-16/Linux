"""""""""""""""""""""""""""""""""""""""""""""""""              
"               ██╗   ██╗██╗███╗   ███╗         "
"               ██║   ██║██║████╗ ████║         "
"               ██║   ██║██║██╔████╔██║         "
"               ╚██╗ ██╔╝██║██║╚██╔╝██║         "
"                ╚████╔╝ ██║██║ ╚═╝ ██║         "
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝         "
"""""""""""""""""""""""""""""""""""""""""""""""""               
set number
"set numberwidth=5
" Enable relative line numbers"
set relativenumber

" Make searching better
set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase

set autowrite     " Automatically :write before running commands

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"set matchpairs+={:}
"set matchpairs+=<:> 

" automatically wrap text that extends beyond the screen lenght
set wrap

"remapping :Files to ctrl-p
nnoremap <C-p> :Files<Cr>
"setting fzf layout to 50%
let g:fzf_layout = { 'down': '50%' }

"encoding
set encoding=utf-8

"setting indent-guides-default on start
let g:indent_guides_enable_on_vim_startup = 1

"remapping f3 key to be toggle for NERDTree
nmap <F3> :NERDTreeToggle<CR>

"setting the system clipboard
set clipboard+=unnamedplus

" STATUS LINE ------------------------------------------------------------ 

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\%l\ col:\%c\ percent:\%p%%

" Show the status on the second to last line.
set laststatus=2

hi StatusLine ctermbg=NONE  ctermfg=green guibg=NONE  guifg=blue

" STATUS LINE xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 

"  Shortcuts for C-language in VIM ------------------------------------------

inoremap ;; <Esc>/<++><Enter>"_c4l

autocmd FileType c inoremap ;i #include<stdio.h><Enter><Enter>
autocmd FileType c inoremap ;m int<Space>main()<Esc>A<Space>{<Enter>}<Esc>kA<Enter>
autocmd FileType c inoremap ;f if()<Space>{<Enter><++><Enter>}<Esc>2k2la 
autocmd FileType c inoremap ;e else<Space>if()<Space>{<Enter><++><Enter>}<Esc>2k8li 
autocmd FileType c inoremap ;p printf("");<++><Esc>6hi
autocmd FileType c inoremap ;s scanf("%",&<++>);<++><Esc>12hi
autocmd FileType c inoremap ;l for(;<++>;<++>)<Space>{<Enter><++><Enter>}<Esc>%12hi


"Shortcuts for C-language in VIM xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 


"PLUGINS
call plug#begin()

Plug 'preservim/NERDTree'
Plug 'bfrg/vim-cpp-modern'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-system-copy'
Plug 'itchyny/lightline.vim'
Plug 'valloric/youcompleteme'
"Plug 'zxqfl/tabnine-vim'
Plug 'rip-rip/clang_complete'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

call plug#end()
