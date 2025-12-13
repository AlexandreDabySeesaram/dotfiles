syntax on
filetype on
filetype plugin on
filetype indent on
set relativenumber
" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

"Set default clip register to be unamed (system) register

"colorscheme lunaperche
colorscheme habamax

"NERDTree toggles
nnoremap <leader>p :NERDTreeToggle<CR>
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

let NERDTreeShowHidden=1
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
