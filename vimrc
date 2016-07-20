set nocompatible              " be iMproved, required
filetype off                  " required

" VimPlug
call plug#begin('~/.vim/plugged')
" Snippets - Autocomplete
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'chrisgillis/vim-bootstrap3-snippets'
"Plug 'ervandew/supertab'
Plug 'Shougo/neocomplete.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'arnaud-lb/vim-php-namespace'
"Plug 'ludovicchabant/vim-gutentags'

" Syntax
Plug 'scrooloose/syntastic'
Plug 'evidens/vim-twig'
Plug 'elzr/vim-json'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'Yggdroot/indentLine'
Plug 'JulesWang/css.vim'
Plug 'hail2u/vim-css3-syntax'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Files - Utilities
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'sjl/gundo.vim'
Plug 'tmhedberg/matchit'
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color Schemas & Icons
Plug 'mhartington/oceanic-next'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'atelierbram/vim-colors_duotones'
"Plug 'google/vim-colorscheme-primary'

" Magic 
" Plug '907th/vim-auto-save'

" Add plugins to &runtimepath
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""
" General Options
""""""""""""""""""""""""""""""""""""""""""""""""""

if has('gui_running')
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar

    if has("x11")
        set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
        "set guifont=Inconsolata-g\ for\ Powerline\ 10
        "set guifont=Hack-Regular\ 10
        let g:airline_powerline_fonts = 1
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32") " Windows specific options 
        set guifont=Consolas:h12
        au GUIEnter * simalt ~x
    endif

    autocmd GUIEnter * set vb t_vb=

elseif $TERM == "xterm-256color"
    set t_Co=256
endif

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
syntax enable                               " Switch syntax highlighting
                                            " also switch on highlighting the last used search pattern.

set hlsearch                                " Highlight search results

set list listchars=tab:»·,trail:·,nbsp:+    " Show the leading whitespaces
set display+=uhex                           " Show unprintables as <xx>
set display+=lastline                       " Show as much as possible of the last line.

set ignorecase                               " Ignore case when searching
set smartcase                                " When searching try to be smart about cases
set background=dark                          " We are dark people...

let g:gundo_prefer_python3 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
   silent colors OceanicNext
   let g:airline_theme='oceanicnext'
   "colors solarized
   "let g:solarized_contrast="high"    "default value is normal
catch /^Vim\%((\a\+)\)\=:E185/
  " deal wit it
endtry

nnoremap <F9> :call ToggleColours()<CR>
function! ToggleColours()
    if g:colors_name == 'OceanicNext'
        let g:airline_theme='solarized'
        let g:solarized_contrast="high"
        silent colors solarized
    elseif g:colors_name == 'solarized'
        let g:gruvbox_contrast_dark='hard'
        let g:airline_theme='gruvbox'
        silent colors gruvbox
    elseif g:colors_name == 'gruvbox'
        silent colors duotone-dark
    elseif g:colors_name == 'duotone-dark'
        silent colors duotone-darkearth
    elseif g:colors_name == 'duotone-darkearth'
        silent colors duotone-darkdesert
    elseif g:colors_name == 'duotone-darkdesert'
        silent colors duotone-darkforest
    elseif g:colors_name == 'duotone-darkforest'
        silent colors duotone-darkpark
    elseif g:colors_name == 'duotone-darkpark'
        silent colors duotone-darkmeadow
    elseif g:colors_name == 'duotone-darkmeadow'
        silent colors duotone-darksea
    elseif g:colors_name == 'duotone-darksea'
        silent colors duotone-darkpool
    elseif g:colors_name == 'duotone-darkpool'
        silent colors duotone-darkspace
    elseif g:colors_name == 'duotone-darkspace'
        silent colors duotone-darkheath
    elseif g:colors_name == 'duotone-darkheath'
        silent colors duotone-darkcave
    elseif g:colors_name == 'duotone-darkcave'
        let g:airline_theme='oceanicnext'
        silent colors OceanicNext
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
nnoremap <F5> :GundoToggle<CR>
noremap  <F6>  :bprev <CR>
noremap  <F7>  :bnext <CR>
noremap  <F8>  :bd <CR>
nnoremap <leader>j :
" Fast Jump to function
nnoremap <leader>f :/function<CR>zz:nohlsearch<CR>
" Tagbar Activation
noremap  <silent><leader>t :TagbarOpenAutoClose<CR>
" Clean highlight after search
noremap  <silent>// :nohlsearch<CR>
" Fast Indent code block inner {
nnoremap <leader>i =i{<C-o>

"Reload the first tab of chromium
nnoremap <silent>,, :silent !sh ~/.vim/scripts/reload_cromium.sh<CR>

" Center on scroll
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" Semicolon at end
inoremap <S-CR> <End>;


"Save on exit wont work if gvim loose focus
"autocmd InsertLeave * write

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
let g:syntastic_html_tidy_exec = 'tidy'

let g:syntastic_javascript_checkers=['jshint'] 

let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]' " Syntastical statusline format
                                                                         "Ignored when powerline is enabled.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
"let g:indentLine_char = '┊'


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
" Ultisnips - Integration Neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custon TAB function to activate completion on 
" Ultisnips + Neocomplete

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return  <SID>check_back_space() ? "\<TAB>"
                            \: neocomplete#start_manual_complete()
            endif
        endif
    endif
    return ""
endfunction

function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}

inoremap <TAB> <C-R>=g:UltiSnips_Complete()<cr>

let g:UltiSnipsExpandTrigger="<NOP>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Folders with Snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "coolsnippets"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tags and Omnicomplete configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=~/.vim/ctags/tags

if has('autocmd')
  augroup OmniCompleteModes
    autocmd!
    autocmd FileType php           nested setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType python        nested setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType css           nested setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown nested setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript    nested setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType xml           nested setlocal omnifunc=xmlcomplete#CompleteTags
  augroup END
endif


"set complete=.,w,b,t,i,k
set complete=.,t,i
set completeopt=longest,menuone "like an editor

 "If not specific completion scripts exits use vim general code
 if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                 \if &omnifunc == "" |
                 \setlocal omnifunc=syntaxcomplete#Complete |
                 \endif
 endif

 autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PhpComplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_search_tags_for_variables = 1
let g:phpcomplete_parse_docblock_comments = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1
" Set max syntax keyword length.
let g:neocomplete#sources#buffer#max_keyword_width = 40
" Max list
let g:neocomplete#max_list = 20

" Use smartcase.
let g:neocomplete#enable_smart_case                 = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern          = '\*ku\*'
let g:neocomplete#enable_auto_delimiter             = 1
let g:neocomplete#enable_refresh_always             = 1


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

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php =
      \'\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" <TAB>: completion.
" Shortcut for toggle neocomplete
noremap <leader>n :NeoCompleteToggle<CR>

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Php-Namespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTAGS - UPDATE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F11> :exe "!sh ~/.vim/scripts/ctagsupdate.sh " . shellescape(expand('%:p:h')) . " ."<CR>

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

" Indent  after break lines 
set breakindent
set showbreak=..

" Linebreak on 500 characters
set lbr
set tw=500

set autoindent                  "Auto indent
set wrap                        "Wrap lines

command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-Pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsShortcutJump = '<C-j>'
let g:AutoPairsShortcutToggle = '<C-k>'
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`','%':'%'}
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

" NOTE: The statusline settings below is ignored if Airline is loaded.
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

