set nocompatible
syntax on
filetype on
filetype plugin on
filetype indent on
" set clipboard to system clipboard
set clipboard=unnamed

set relativenumber

" Press F2 to toggle paste mode
set pastetoggle=<F2>

" esc in insert & visual mode
inoremap kj <esc>
vnoremap kj <esc>
"
" " esc in command mode
cnoremap kj <C-C>

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
" set wildmode=list:longest
set wildmode=longest:full,full

" Provides tab-completion for all file-related tasks
set path+=**

"colorscheme lunaperche
colorscheme habamax


"Use automatic closing of matching brackets

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O


"NERDTree toggles
nnoremap <leader>p :NERDTreeToggle<CR>
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

let NERDTreeShowHidden=1 ""Let show hidden files in the nerdtree window 
" Start NERDTree when Vim is started without file arguments.
" "autocmd StdinReadPre * let s:std_in=1
" "autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Add text highligh in search in real time typing
set hlsearch
set incsearch


" Check if a Conda environment is active
if exists('$CONDA_PREFIX')
    " For Linux/macOS, the binary is in /bin/
    let s:conda_python = $CONDA_PREFIX . '/bin/python'
    
    " Check if the file actually exists before setting it
    if filereadable(s:conda_python)
        let g:jedi#environment_path = s:conda_python
    endif
endif


" personalise status bar

" Always show status bar
set laststatus=2
"
" " Format the status line
set statusline=
set statusline+=%f        " Path to the file
set statusline+=\ [%M]    " Modified flag [+]
set statusline+=%=        " Switch to the right side
set statusline+=%l/%L     " Current line / Total lines
set statusline+=\ (%p%%)  " Percentage through file


" set vimwiki to handle markdown files in a Logseq compatible way

let g:vimwiki_list = [{
  \ 'path': '~/Documents/LogSeq/pages',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'diary_rel_path': '../diary/',
  \ }]
" Set directory change automatically in vimwikik
""let g:vimwiki_auto_chdir = 1
" Set directory change automatically in vim altogether
set autochdir
" Let vimwiki auto complete file name within pages/ directory from diary directory
" as well
autocmd FileType vimwiki setlocal path+=~/Documents/LogSeq/pages/**
" Prevent Vimwiki from treating every .md file on your system as a wiki
let g:vimwiki_global_ext = 0
