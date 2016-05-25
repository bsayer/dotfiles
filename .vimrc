" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'lifepillar/vim-solarized8'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'joonty/vdebug'
Plugin 'joonty/vim-phpqa'
Plugin 'joshhartigan/vim-reddit'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'dag/vim-fish'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'craigemery/vim-autotag'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"execute pathogen#infect()

set termguicolors
set nocompatible
set gfn=Input:h12
let mapleader = "\<space>"
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
" Toggle cursorline
nnoremap <leader>l :set cursorline!<CR>
" Deal with trailing whitespace
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
" Toggle paste
nnoremap <Leader>v :set paste!<CR>
" Goto paired brace with tab key
nnoremap <tab> %
vnoremap <tab> %
" Vertical split and change to it
nnoremap <leader>w <C-w>v<C-w>l
" Date & time stamp
nnoremap <leader>dt a### <C-R>=strftime("%a %b %e %H:%M")<CR> ###<CR><CR><Esc>
set formatoptions=qrn1
" Disable Ex mode
nnoremap Q <nop>
set foldmethod=manual
" Map leader-m to open the file in Marked
nnoremap <Leader>m :silent !open -a Marked.app '%:p'<cr>

nnoremap <silent><leader>n :set rnu! rnu? <cr>

let php_folding = 0        "Set PHP folding of classes and functions.
let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
"let php_noShortTags = 1    "Disable PHP short tags.

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <leader>d :call pdv#DocumentWithSnip()<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Line wrapping
set breakindent
set breakindentopt=sbr
set showbreak=↪

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"set background=light
"colorscheme solarized
colorscheme solarized8_light_flat
let g:solarized_visibility = "low"

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
"set cursorline

" tab settings
set tabstop=3
set softtabstop=3
set shiftwidth=3
set shiftround

if has('mouse')
  set mouse=a
endif

:nnoremap <F12> :buffers<CR>:buffer<Space>

" UltiSnips Settings
let g:UltiSnipsEditSplit="context"

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

	"augroup CursorLine
		"au!
		"au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
		""au VimEnter,WinEnter,BufWinEnter * highlight cursorline cterm=NONE guibg=#EEE8D5 guifg=fg
		"au WinLeave * setlocal nocursorline
	"augroup END

	" Needed to recognize .md as markdown in older Vim versions
	au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

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

	" Set up :make to use fish for syntax checking.
	autocmd FileType fish compiler fish
	" Set this to have long lines wrap inside comments.
	autocmd FileType fish setlocal textwidth=79
	" Enable folding of block structures in fish.
	"autocmd FileType fish setlocal foldmethod=expr

endif " has("autocmd")
