set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Repos on github

" Snippets - Autocomplete
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'chrisgillis/vim-bootstrap3-snippets'
Plugin 'shawncplus/phpcomplete.vim'
" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'evidens/vim-twig'
Plugin 'elzr/vim-json'
Plugin '2072/PHP-Indenting-for-VIm'
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" Files - Utilities
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'sjl/gundo.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'bling/vim-airline'
" Color Schemas
Plugin 'altercation/vim-colors-solarized'
Plugin 'gilsondev/lizard'
Plugin 'chriskempson/vim-tomorrow-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""
" General Options 
""""""""""""""""""""""""""""""""""""""""""""""""""

if has('gui_running')
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t  
    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
endif

if $TERM == "xterm-256color"
  set t_Co=256
endi

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

set showmatch                               " Show matching braces when over one
set ruler                                   " Always show current position
set number                                  " Always show line-numbers
set numberwidth=5                           " Line-number margin width
set mousehide                               " Do not show mouse while typing
set antialias                               " Pretty fonts
set linespace=0                             " Don't insert any extra pixel lines
set lazyredraw                              " Don't redraw while running macros
set wildmenu                                " Wild menu
set wildmode=longest,list,full              " Wild menu options
set cpoptions+=$
set pastetoggle=<F3>                        " Easy paste from SO
syntax on                                   " Switch syntax highlighting on, when the terminal has colors  
                                            " also switch on highlighting the last used search pattern.

set hlsearch                                " Highlight search results

set list listchars=tab:»·,trail:·,nbsp:+    " Show the leading whitespaces
set display+=uhex                           " Show unprintables as <xx>
set display+=lastline                       " Show as much as possible of the last line.

set ignorecase                               " Ignore case when searching
set smartcase                                " When searching try to be smart about cases 
set background=dark                          " We are dark people...


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
   colors solarized
   let g:solarized_contrast="high"    "default value is normal
catch /^Vim\%((\a\+)\)\=:E185/
  " deal wit it
endtry

nnoremap <F9> :call ToggleColours()<CR>
function! ToggleColours()
    if g:colors_name == 'solarized'
        colorscheme Tomorrow-Night
    elseif g:colors_name == 'Tomorrow-Night'
        colorscheme lizard
    else
        colorscheme solarized
        let g:solarized_contrast="high" 
    endif
endfunction

" In many terminal emulators the mouse works just fine, thus enable it.
if v:version >= 702 && has('mouse')
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    set ttymouse=xterm2
  endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Re-Maps 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader="ñ"

nnoremap <leader>s :update<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
noremap <F6>  :bprev <CR>
noremap <F7>  :bnext <CR>
noremap <F8>  :bd <CR>
nnoremap <leader>j :
" Fast Jump to function
nnoremap <leader>f :/function<CR>zz:nohlsearch<CR>
" Tagbar Activation
noremap <silent><leader>t :TagbarOpenAutoClose<CR>
" Clean highlight after search
nmap <silent><leader>/ :nohlsearch<CR>
" Fast Indent code block
nnoremap <leader>i =a{
" Remap Esc on insert mode
imap <leader><leader> <Esc>

"Reload the first tav o chromium
nnoremap ,, :silent !sh ~/scripts/reload_cromium.sh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Easy move line or visual block up down
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Movin a line
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_php_checkers=['php' ]       " Syntastics array options ejem chain of php phpcs phpms   
                                            " phpcs and phpms must be installed

let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]' " Syntastical statusline format 
                                                                         "Ignored when powerline is enabled.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_theme="molokai"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader><leader> :CtrlPMRUFiles<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 1     " Search filename by default instead full path

"Symfony specific dirs ignored
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*vendor*,*web*,*app/cache*,*app/logs*
let g:ctrlp_root_markers = ['src/', '.git/','.hg/','_darcs','.bzr']

"let g:ctrlp_extensions = ['tag']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Folders with Snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "coolsnippets"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tags and Omnicomplete configs 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=~/.vim/tags/tags

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set complete=.,w,b,k,t,i
set completeopt=menuone,preview
 filetype plugin indent on     " required!
 "If not specific completion scripts exits use vim general code
 if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                 \if &omnifunc == "" |
                 \setlocal omnifunc=syntaxcomplete#Complete |
                 \endif
 endif

 autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTAGS - UPDATE 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F11> :exe "!sh ~/.vim/tags/ctagsupdate.sh " . shellescape(expand('%:p:h')) . " ."<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 1 tab == 4 spaces
set expandtab                    " Use spaces instead of tabs
set smarttab                     " Be smart when using tabs ;)
set tabstop=4                    " set the default tabstops
set shiftwidth=4                 " set the default autoindent
set softtabstop=4
set hidden

" Linebreak on 500 characters
set lbr
set tw=500

set ai                          "Auto indent
set si                          "Smart indent
set wrap                        "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  DelimitMate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1        " Add spaces both sides
" Imap easy out jump at the right 
imap <C-J> <Plug>delimitMateJumpMany
" Imaps S-tab used by Supertab and add new ready text argument
imap <C-K> <Plug>delimitMateS-Tab
" Imaps S-tab used by Supertab and add new ready text argument
imap <C-l> <Plug>delimitMateS-Tab, '
" Fix expand enter broken by pop-up menus
imap <expr> <CR> pumvisible()
                     \ ? "\<C-Y>"
                     \ : "<Plug>delimitMateCR" 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F2> :NERDTreeToggle<CR>

"autocmd vimenter * if !argc() | NERDTree | endif        " Auto start with Vim
let NERDTreeWinSize = 40
let NERDTreeBookmarksFile = expand('~/.vim/NERDTreeBookmarks')
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeIgnore=['\.o$', '\.so$', '\.bmp$', '\.class$', '^core.*', '\.vim$', '\~$',
                   \'\.pyc$', '\.pyo$', '\.jpg$', '\.gif$','\.png$', '\.ico$', '\.exe$',
                   \'\.cod$', '\.obj$', '\.mac$', '\.1st', '\.dll$', '\.pyd$', '\.zip$', 
                   \'\.modules$','\.git', '\.hg', '\.svn', '\.bzr' ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Gutter Custom Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F4> :GitGutterSignsToggle<CR>
highlight clear SignColumn
let signify_sign_weight = 'NONE'
let g:gitgutter_signs = 0                                                           "Disabled Column Sing by default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statuls Line  & Scroll Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2      " show status line all the time
set scrolloff=10      " don't scroll any closer to top/bottom
set sidescrolloff=5   " don't scroll any closer to left/right

" NOTE: The statusline settings below is ignored if powerline is loaded.
set statusline=%t                                                                   " tail of the filename
set statusline+=\                                                                   " whitespace
set statusline+=[%{strlen(&fenc)?&fenc:'none'},                                     " file encoding
set statusline+=%{&ff}]                                                             " file format
set statusline+=%h                                                                  " help file flag
set statusline+=%m                                                                  " modified flag
set statusline+=%r                                                                  " read only flag
set statusline+=%y                                                                  " filetype
set statusline+=%w                                                                  " filetype
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%=                                                                  " left/right separator
set statusline+=\ %#warningmsg#                                                     " start warnings highlight group
set statusline+=%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''} " SyntasticStatusLine
set statusline+=%*                                                                  " end highlight group
set statusline+=%c,                                                                 " cursor column
set statusline+=%l/%L                                                               " cursor line/total lines
set statusline+=\ %P                                                                " percent through file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [ Highlight the match in red]  (Thx Damian Conway)
" Backups, undos, and swap files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    highlight WhiteOnRed guibg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 600) . 'm'
    call matchdelete(ring)
    redraw
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backups, undos, and swap files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup
" Prevent backups from overwriting each other. The naming is weird,
" since I'm using the 'backupext' variable to append the path.
" So the file '/home/docwhat/.vimrc' becomes '.vimrc%home%docwhat~'
if has("autocmd")
  autocmd BufWritePre * let &backupext = substitute(expand('%:p:h'), '/', '%', 'g') . '~'
endif


" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
  set undolevels=1000         " maximum number of changes that can be undone
  set undoreload=10000        " maximum number lines to save for undo on a buffer reload
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

