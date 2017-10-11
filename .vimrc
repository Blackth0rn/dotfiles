set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'joonty/vdebug'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'Shougo/neocomplete'
Plugin 'Raimondi/delimitMate'
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dsolstad/vim-wombat256i'
Plugin 'w0rp/ale'

call vundle#end()

" Colorscheme
set background=dark
colorscheme wombat256i

" Syntax highlighting
syntax enable

" 256 colors instead of 8
set t_Co=256

"Autocomplete background color - default is unreadable
highlight Pmenu ctermbg=blue ctermfg=white

" Smart indenting when starting new line
set copyindent
set preserveindent
set expandtab
set shiftwidth=4
set softtabstop=0
set tabstop=4
set cindent
set cinoptions=(0,u0,U0

"Use different indent rules for specific filetypes
filetype plugin indent on
filetype plugin on
set completeopt=menu

" Show line numbers
set number

" Show line and column number, relative scroll position etc.
set ruler

" Ignore case in searches, unless search contains upper case
set ignorecase
set smartcase
set wildignorecase

" Set tags file
set tags=./tags;/,tags;/
"Minimum number of lines to keep above/below cursor when scrolling
set scrolloff=3

" Unbind the cursor keys in insert, normal and visual modes
for prefix in ['n', 'v']
	for key in ['<Up>', '<Down>', '<Left>', '<Right>']
		exe prefix . "noremap " . key . " <Nop>"
        endfor
endfor

" Arrow Keys navigat split windows
nmap <Up> <C-W><Up>
nmap <Down> <C-W><Down>
nmap <Left> <C-W><Left>
nmap <Right> <C-W><Right>

" Open new splits to right/below by default
" C-w v for vertical split, C-w s for horizontal split
set splitbelow
set splitright

" Show whitespace
set list
set listchars=nbsp:.,tab:>-,trail:~,extends:>,precedes:<

" Show status line always
set laststatus=2
set statusline+=%f

" Setup xdebug settings for HS
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000
let g:vdebug_options["path_maps"] = {"/var/www/gregmatthews": "/home/greg/code/headshot_server"}

" NEOCOMPLETE config
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:neocomplete#sources#omni#functions = {
	\ 'javascript' : 'js#CompleteJS'
	\ }

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" CtrlP config

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
