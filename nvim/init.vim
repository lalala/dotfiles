execute pathogen#infect()

" fix for webpack hot reload...
set backupcopy=yes

set nocompatible

set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber

" let mapleader = ","
let mapleader = " "

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader>, :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set list
set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

syntax enable

set background=dark
colorscheme molokai

hi Normal ctermbg=none
hi ColourColumn ctermbg=0

" search
set inccommand=split
hi Search ctermbg=1 ctermfg=7
hi IncSearch ctermbg=1 ctermfg=7

" ctrl-p config
set wildignore+=*/node_modules/*,*/coverage/*
let g:ctrlp_cmd='CtrlP :pwd'

" swap files
set directory^=$HOME/.vim/tmp//

" indent line

let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_color_term = 236

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']

let g:neomake_verbose = -1

"let g:neomake_open_list=2

function! NeomakeESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'

  if executable('npm-which')
    let l:eslint = split(system('npm-which eslint'))[0]
  "  return 0
  endif

  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
    let l:eslint = l:npm_bin . '/eslint'
  endif

  let g:neomake_javascript_eslint_exe = l:eslint
endfunction

autocmd FileType javascript :call NeomakeESlintChecker()

autocmd! BufWritePost,BufEnter * Neomake

let g:neomake_verbose=3
let g:neomake_logfile='/home/per/neomake.log'

" copy paste with clipboard
" function! ClipboardYank()
"   call system('xclip -i -selection clipboard', @@)
" endfunction
"
" function! ClipboardPaste()
"   let @@ = system('xclip -o -selection clipboard')
" endfunction
"
" vnoremap <silent> y y:call ClipboardYank()<cr>
" vnoremap <silent> d d:call ClipboardYank()<cr>
" nnoremap <silent> p :call ClipboardPaste()<cr>p


" insert newline with C-J

nnoremap <C-J> i<CR><Esc>

" esformatter
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

" easymotion
map <Plug>(easymotion-prefix) <Space>
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>e <Plug>(easymotion-e)
" nerdtree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exiosts("s:std_in") | NERDTree | endif

map <Leader>m :NERDTreeToggle<CR>

" rust specific
autocmd FileType rust setlocal sw=4 sts=4 ts=4 et

" Close buffer without closing window...
nmap ,d :b#<bar>bd#<CR>
