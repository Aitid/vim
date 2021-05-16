
"set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'          	" Class/module browser

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
" Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
" Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
" Plugin 'tpope/vim-surround'	   	        " Parentheses, brackets, quotes, XML tags, and more
Plugin 'othree/xml.vim'
Plugin 'gregsexton/MatchTag'            "Подсветка парных тегов
Plugin 'tpope/vim-fugitive'             "fugitive.vim may very well be the best Git wrapper of all time
Plugin 'tpope/vim-pathogen'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/BufOnly.vim' "Close all buffers :BufOnly
Plugin 'iberianpig/tig-explorer.vim' "Vim plugin to use Tig as a git client.

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo
Plugin 'scrooloose/syntastic'

"---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'tomtom/checksyntax_vim'
" ---PHP ---
Plugin 'StanAngeloff/php.vim'
" database
Plugin 'dbext.vim'

" let g:dbext_default_profile = 'yandex'
" :DBSetOption profile=yandex


call vundle#end()            		" required

execute pathogen#infect()
filetype on
filetype plugin on
filetype plugin indent on

set viminfo='1000,f1,:1000,/1000
set history=1000

let g:pymode_python = 'python3'
""------  Visual Options  ------
syntax on
set nonumber
"set nowrap
set vb
set ruler
set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P
let g:buftabs_only_basename=1
let g:buftabs_marker_modified = "+"

" Toggle whitespace visibility with ,s
nmap <Leader>s :set list!<CR>
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×,eol:¬

" ,L = Toggle line numbers
map <Leader>L :set invnumber<CR>

" New splits open to right and bottom
set splitbelow
set splitright

"------  Generic Behavior  ------
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

vnoremap < <gv
vnoremap > >gv

filetype indent on
filetype plugin on
set autoindent
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,node_modules/*

"allow deletion of previously entered data in insert mode
set backspace=indent,eol,start

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>

" When pressing ,cd switch to the directory of the open buffer
map ,cd :cd %:p:h<CR>

"------  Text Navigation  ------
" Prevent cursor from moving to beginning of line when switching buffers
set nostartofline

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" H = Home, L = End
 noremap H ^
 noremap L $
 vnoremap L g_

"------  Window Navigation  ------
"" ,hljk = Move between windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k


"------  Buffer Navigation  ------
"" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

" ,q Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>

" ,Q Closes the current window
nnoremap <silent> <Leader>Q <C-w>c


"------  Searching  ------
set incsearch
set ignorecase
set smartcase
set hlsearch

" Clear search highlights when pressing ,b
nnoremap <silent> <leader>b :nohlsearch<CR>


" ack-grep integrates easily with the Vim text editor
set grepprg=ack-grep\ -H

" CtrlP will load from the CWD, makes it easier with all these nested repos
let g:ctrlp_working_path_mode = ''

"type S, then type what you're looking for, a /, and what to replace it with
nmap S :%s//g<LEFT><LEFT>
vmap S :s//g<LEFT><LEFT>


"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS','\.dSYM$']

"setting root dir in NT also sets VIM's cd
let NERDTreeChDirMode=2

" Toggle visibility using ,n
noremap <silent> <Leader>n :NERDTreeToggle<CR>

" These prevent accidentally loading files while focused on NERDTree
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>


"------  Tagbar Plugin Options  ------
" http://adamyoung.net/Exuberant-Ctags-OS-X
" http://www.vim.org/scripts/script.php?script_id=273
let g:tagbar_width=26
noremap <silent> <Leader>y :TagbarToggle<CR>

"------  Fugitive Plugin Options  ------
"https://github.com/tpope/vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove
nnoremap <Leader>gp :Ggrep
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git
nnoremap <Leader>gd :Gdiff<CR>

"------  Text Editing Utilities  ------
" ,T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>

" ,U = Deletes Unwanted empty lines
map <Leader>U :g/^$/d<CR>

" ,R = Converts tabs to spaces in document
map <Leader>R :retab<CR>

" Deletes trailing space in file upon write
autocmd BufWritePre * :%s/\s\+$//e


"------  JSON Filetype Settings  ------
au BufRead,BufNewFile *.json set filetype=json
let g:vim_json_syntax_conceal = 0
nmap <silent> =j :%!python -m json.tool<CR>:setfiletype json<CR>


"------  CoffeeScript Filetype Settings  ------
" au BufNewFile,BufReadPost *.coffee set shiftwidth=2 softtabstop=2 expandtab
" autocmd BufNewFile,BufRead *.coffee set filetype=coffee
" au BufWritePost *.coffee silent make!
" autocmd QuickFixCmdPost * nested cwindow | redraw!


"------  PHP Filetype Settings  ------
" ,p = Runs PHP lint checker on current file
map <Leader>p :! php -l %<CR>

" ,P = Runs PHP and executes the current file
map <Leader>P :! php -q %<CR>

au FileType php set omnifunc=phpcomplete#CompletePHP

augroup vimrc_autocmds
 autocmd!
 autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
 autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
 autocmd FileType ruby,python,javascript,c,cpp set nowrap
 augroup END

function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

"-----------scrooloose/syntastic--------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

highlight SyntasticWarning guibg=#2f0000

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "level": "warnings" }
let g:syntastic_ignore_files = ['\.py$']
"-----------------------------------------------------

" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"
let g:snipMate = { ‘snippet_version’ : 1 }

" настройки Vim-Airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" TagBar настройки
    map <F4> :TagbarToggle<CR>
    let g:tagbar_autofocus = 0 " автофокус на Tagbar при
" открытии

" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>


"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$']


" TaskList настройки
map <F2> :TaskList<CR> 	   " отобразить список тасков на F2

" Работа буфферами
map <C-q> :bd<CR> 	   " CTRL+Q - закрыть текущий буффер

  "=====================================================
  "" Python-mode settings
  "=====================================================
  " отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
  " let g:pymode_rope = 0
  " let g:pymode_rope_completion = 0
  " let g:pymode_rope_complete_on_dot = 0

  "oтключить номерацию строк 1
  let g:pymode_options = 0
  " документация
  let g:pymode_doc = 1
  let g:pymode_doc_key = 'K'
  " отключаем валидацию по длинее строки
  let g:pymode_lint_ignore = ["E501", ]
  " провека кода после сохранения
  let g:pymode_lint_write = 1


   " поддержка virtualenv
  let g:pymode_virtualenv = 1

 " установка breakpoints
   let g:pymode_breakpoint = 1
   let g:pymode_breakpoint_key = '<leader>b'

   let g:pymode_run = 1

  " подстветка синтаксиса
   let g:pymode_syntax = 1
   let g:pymode_syntax_all = 1
   let g:pymode_syntax_indent_errors = g:pymode_syntax_all
   let g:pymode_syntax_space_errors = g:pymode_syntax_all

   " отключить autofold по коду
   let g:pymode_folding = 0

   "переключаться между кириллицей и латиницей нажатием Ctrl+^
   set keymap=russian-jcukenwin
   set iminsert=0
   set imsearch=0
   highlight lCursor guifg=NONE guibg=Cyan



"------  GUI Options  ------
if has("gui_running")
	" Hides toolbar and scrollbars and File menu
	set guioptions=egt

	" Highlights the current line background
	set cursorline
	colorscheme Tomorrow-Night

	"autocmd VimEnter * TagbarOpen

	"Invisible character colors
	highlight NonText guifg=#4a4a59
	highlight SpecialKey guifg=#4a4a59

	if has("gui_macvim") " OS X
		"set guifont=Monaco:h14
		set guifont=Monaco:h12
		"set noantialias
		"set transparency=15

		" Swipe to move between bufers :D
		map <silent> <SwipeLeft> :bprev<CR>
		map <silent> <SwipeRight> :bnext<CR>

		" Cmd+Shift+N = new buffer
		map <silent> <D-N> :enew<CR>

		" Cmd+t = new tab
		nnoremap <silent> <D-t> :tabnew<CR>

		" Cmd+w = close tab (this should happen by default)
		nnoremap <silent> <D-w> :tabclose<CR>

		" Cmd+1...9 = go to that tab
		map <silent> <D-1> 1gt
		map <silent> <D-2> 2gt
		map <silent> <D-3> 3gt
		map <silent> <D-4> 4gt
		map <silent> <D-5> 5gt
		map <silent> <D-6> 6gt
		map <silent> <D-7> 7gt
		map <silent> <D-8> 8gt
		map <silent> <D-9> 9gt

		" OS X probably has ctags in a weird place
		let g:tagbar_ctags_bin='/usr/local/bin/ctags'

	elseif has("gui_gtk2") " Linux
		set guifont=monospace\ 9

		" Alt+n = new buffer
		map <silent> <A-n> :enew<CR>

		" Alt+t = new tab
		nnoremap <silent> <A-t> :tabnew<CR>

		" Alt+w = close tab
		nnoremap <silent> <A-w> :tabclose<CR>

		" Alt+1...9 = go to that tab
		map <silent> <A-1> 1gt
		map <silent> <A-2> 2gt
		map <silent> <A-3> 3gt
		map <silent> <A-4> 4gt
		map <silent> <A-5> 5gt
		map <silent> <A-6> 6gt
		map <silent> <A-7> 7gt
		map <silent> <A-8> 8gt
		map <silent> <A-9> 9gt

	elseif has("gui_win32") " Windows
		" WHAT ARE YOU DOING WITH YOUR LIFE?!
	endif
else
	set t_Co=256
    " colorscheme Mustang
endif

