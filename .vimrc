execute pathogen#infect()
call pathogen#helptags()

set nocompatible
let mapleader = ","
set shell=/bin/bash
set modelines=0
set wildmode=list:longest
set visualbell
set number
set relativenumber
set noshowmode
set ttyfast
set showmatch
set hlsearch
" Clear highlights
nnoremap <leader><space> :noh<cr>
" Deal with trailing whitespace
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
" Goto paired brace with tab key
nnoremap <tab> %
vnoremap <tab> %
" Vertical split and change to it
nnoremap <leader>w <C-w>v<C-w>l
set formatoptions=qrn1
" Disable Ex mode
nnoremap Q <nop>
set foldmethod=manual

let php_folding = 1        "Set PHP folding of classes and functions.
let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
let php_noShortTags = 1    "Disable PHP short tags.

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <leader>d :call pdv#DocumentWithSnip()<CR>

set background=light
colorscheme solarized

" Vim-Airline Settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Load CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_map='<Leader>p'
let g:ctrlp_cmd='CtrlP'
set wildignore+=*/tmp/*,*.git,*.so,*.swp,*.zip

set colorcolumn=80,120

" tab settings
set tabstop=3
set softtabstop=3
set shiftwidth=3
set shiftround

if has('mouse')
  set mouse=a
endif

:nnoremap <F12> :buffers<CR>:buffer<Space>

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Needed to recognize .md as markdown in older Vim versions
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" phpqa settings
"
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0

" Show code coverage on load (default = 0)
let g:phpqa_codecoverage_autorun = 0

" Open the location list automatically (default = 1)
let g:phpqa_open_loc = 1

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  au BufRead,BufNewFile *.mh set filetype=php

  augroup END

endif " has("autocmd")
