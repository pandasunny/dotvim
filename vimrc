"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filename: vimrc
" Owner: pandasunny
" Created: 2011-04-29 11:05:19
" Last Modified: 2011-04-29 11:05:39
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Initialize settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let $LANG = 'zh_CN.UTF-8'
language english
set nocompatible

" auto load the pathogen plugin
runtime bundle/pathogen/autoload/pathogen.vim
" call pathogen#runtime_append_all_bundles()
call pathogen#infect()
" call pathogen#helptags()

" do not show the message when start
set shortmess=atI

" set encoding and termencoding to utf-8
set encoding=utf-8
let &termencoding=&encoding
set autoread
set history=1000
filetype plugin indent on
" When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source $VIMFILES/vimrc
" switch to the workspace
au VimEnter * cd $WORKSPACE
" set grepprg=grep\ -nH
set lines=40 columns=100
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" Key map settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change the leader key from \ to ;
let mapleader = ";"
let g:mapleader = ";"
" Change ESC to jj
inoremap jj <ESC>
" Fast save file
nmap <leader>w :w!<cr>
" Fast edit the vimrc with <leader>ee
map <leader>ee :e! $VIMFILES/vimrc<cr>
" Fast load the vimrc with <leader>ss
map <silent> <leader>ss :source $VIMFILES/vimrc<cr>
" ms windows behave
if has("win32")
    source $VIMRUNTIME/mswin.vim
endif
" Select all
" map <C-a> ggVG
" Fast Copy and Paste
" map <C-c> "+y
" map <C-v> "+p
" Fast move in insert mode
noremap! <M-j> <Down>
noremap! <M-k> <Up>
noremap! <M-h> <left>
noremap! <M-l> <Right>
" Cancel the directionkeys
nnoremap <up> <nop> 
nnoremap <down> <nop> 
nnoremap <left> <nop> 
nnoremap <right> <nop> 
inoremap <up> <nop> 
inoremap <down> <nop> 
inoremap <left> <nop> 
inoremap <right> <nop>
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" bind the keymaps of tab
" nmap <C-t>   :tabnew<cr>
" nmap <C-p>   :tabprevious<cr>
" nmap <C-n>   :tabnext<cr>
" nmap <C-k>   :tabclose<cr>
" nmap <C-Tab> :tabnext<cr> 
" Cancel the highlight with <leader><space>
nnoremap <leader><space> :noh<cr>
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Insert current time with <leader>mt in Insert mode
imap <leader>mt <c-r>=strftime('%Y-%m-%d %X')<cr>
" Maximize the windows in win32
if has("win32")
    let g:shell_fullscreen_items="T"
    " map <F11> <Esc>:call libcallnr($VIMFILES."/addons/gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    " map <silent> <F11> :simalt ~x<cr>
    " map <silent> <F12> :simalt ~r<cr>
endif
" Maximize the windows in GNOME
" alt+f10 max the window
" alt+f5 restore the window
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" User interface settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set base UI
set guioptions-=T
set guioptions-=t
set guioptions-=v
set guioptions-=e
set guioptions-=r
set guioptions-=L
" set guioptions+=m
" Set 7 lines to the curors
set so=7
" Turn on Wild menu
set wildmenu
" Always show the ruler
set ruler
" The commandbar height
set cmdheight=2
" Change buffer without save 
set hid
" Set backspace config
set backspace=indent,eol,start
set whichwrap+=b,s,<,>,[,]
" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch
set nowrapscan
" do not redraw after run macro
set nolazyredraw
" set magic
set magic
" auto match the bracker
set showmatch
set mat=2
" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" set the line space
set linespace=2
" always show the number and set the number width
set number
"set relativenumber
set numberwidth=5
" keep the same width/height of windows
set equalalways
" tabpage
set tabpagemax=9
set showtabline=2
" set the tab label
set guitablabel=%ts
" suppose the mouse
if has("mouse")
    set mouse=a
endif
" set statusbar height
set laststatus=2
" set the content of status line
set rulerformat=%15(%c%V\ %p%%%)

set statusline=[%n]\ %f%m%r%h%y\ [%{&fileformat},%{&fileencoding}]\ 
set statusline+=\ [PWD]\ %{CurDir()}\ 
set statusline+=%=\ [ascii]\ %b\ [hex]\ %B\ 
set statusline+=\ [Line]\ %l/%L,%c\ %p%%\ 
" set statusline+=\ %{&fenc}\  

function! CurDir()
    return substitute(getcwd(), "", "", "g")
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

"  Color and Font settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always enable the syntax color
syntax enable
" config the colorscheme and font
if has("gui_running")
    " colorscheme desert
    " colorscheme xoria256
    colorscheme molokai
    hi Todo guifg=orangered guibg=yellow2
    " hi Todo guifg=#FFFFFF guibg=bg      gui=bold
    hi TabLine guifg=#a09998 guibg=#202020 gui=underline
    hi TabLineFill guifg=#a09998 guibg=#202020 gui=underline
    hi TabLineSel guifg=#efefef guibg=#404850 gui=underline
    " let g:molokai_original=0
    if has("win32")
        set guifont=Yahei_Mono:h10:cANSI
    elseif has("unix")
        set guifont=Monospace\ 10
    endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" File settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the file formats
set ffs=unix,dos,mac
" set the file type
set fileencodings=utf-8,uce-bom,gb108030,gbk,gb2312,cp936
" double width with CJK
set ambiwidth=double
" set the tab key
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
" use »(U00BB)- to show tab and ¬(U00AC) to show eol
set listchars=tab:»-,eol:¬
" set the line breakat
set lbr
set tw=500
" set indent
set ai
set si
set nowrap
" set the backup dir of files
set backupdir=$VIMFILES/data/backup
" set the swap dir
set dir=$VIMFILES/data/swap
" close the backup
set nobackup
set nowb
set noswapfile
" set persistent undo
set undofile
set undodir=$VIMFILES/data/undodir
set undolevels=1000
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" Filetype settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd BufRead,BufNewFile,FileReadPost *.py source $VIMFILES/_vimrc/python.vim
" autocmd BufRead,BufNewFile,FileReadPost *.py source $VIMFILES/_vimrc/ipy.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" Omni-completion and dictionary settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set complete=.,w,b,k,t,i
set completeopt=longest,menu
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet
autocmd FileType php set omnifunc=phpcomplete#CompletePHP 

autocmd filetype javascript set dictionary+=$VIMFILES/dict/javascript.dict
autocmd filetype css set dictionary+=$VIMFILES/dict/css.dict
"css 2.1 dictionary
"autocmd filetype css set dictionary+=$VIMFILES/dict/css2.1.dict
autocmd filetype php set dictionary+=$VIMFILES/dict/php.dict
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" File syntax settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" .py
" let python_highlight_all = 1
" autocmd filetype py set cc=80

" .js
" Better JavaScrirpt syntax support, http://www.vim.org/scripts/script.php?script_id=1491 
let javascript_enable_domhtmlcss=1

" .Css
" Support css3, http://www.vim.org/scripts/script.php?script_id=3042
autocmd BufRead,BufNewFile *.css set ft=css syntax=css3

" .php
" vim-php-stuff, https://github.com/paulyg/Vim-PHP-Stuff#readme

" Check the syntax of a PHP file
function! CheckPHPSyntax()
    if &filetype != 'php'
        echohl WarningMsg | echo 'This is not a PHP file !' | echohl None
        return
    endif
    setlocal makeprg=\"D:\program\xampp\php\php.exe\"\ -l\ -n\ -d\ html_errors=off\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    echohl WarningMsg | echo 'Syntax checking output:' | echohl None
    if &modified == 1
        silent write
    endif
    silent make
    clist
endfunction
au filetype php map <F5> :call CheckPHPSyntax()<CR>
au filetype php imap <F5> <ESC>:call CheckPHPSyntax()<CR>
" Run a PHP script
function! ExecutePHPScript()
    if &filetype != 'php'
        echohl WarningMsg | echo 'This is not a PHP file !' | echohl None
        return
    endif
    setlocal makeprg=\"D:\program\xampp\php\php.exe\"\ -f\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    echohl WarningMsg | echo 'Execution output:' | echohl None
    if &modified == 1
        silent write
    endif
    silent make
    clist
endfunction
au filetype php map <C-F5> :call ExecutePHPScript()<CR>
au filetype php imap <C-F5> <ESC>:call ExecutePHPScript()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" Filetype format settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Only do this part when compiled with support for autocommands
if has("autocmd")

    autocmd FileType text setlocal ts=4 sts=4 sw=4 noexpandtab

    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Customisations based on house-style (arbitrary)
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" Plug-ins settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" MRU plug-in settings {{{
" @url: http://www.vim.org/scripts/script.php?script_id=521
" @git: https://github.com/vim-scripts/mru.vim
" @command: :MRU show files list, q close the list
let MRU_Max_Entries = 1000 
if has("win32")
    let MRU_File = $VIMFILES.'\data\win_mru_file.txt'
elseif has("unix")
    let MRU_File = $VIMFILES.'/data/unix_mru_file.txt'
endif
" }}}

" bufexplorer plug-in settings {{{
" @url: http://www.vim.org/scripts/script.php?script_id=42
" @git: https://github.com/vim-scripts/bufexplorer.zip.git
" @command: <leader>o: show the bufexplorer windows
map <leader>o :BufExplorer<cr>
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy="mru"
" }}}

" NERD_tree plug-in settings {{{
" @url: http://www.vim.org/scripts/script.php?script_id=1658 
" @git: https://github.com/scrooloose/nerdtree.git
" @command: <leader>nt: show the NERDTree window 
nmap <silent> <leader>nt :NERDTreeToggle<cr>
let NERDTreeChDirMode = 1
" let NERDTreeShowLineNumbers = 1
" let NERDTreeQuitOnOpen = 1
" let NERDTreeShowHidden = 1
" let NERDTreeWinPos = "right"
" let NERDTreeWinSize = 30
let NERDTreeIgnore=['\.pyc$', '\.exe$', '\~$']
if has("win32")
    let NERDTreeBookmarksFile = $VIMFILES.'\data\win_nerd_bookmark.txt'
elseif has("unix")
    let NERDTreeBookmarksFile = $VIMFILES.'/data/unix_nerd_bookmark.txt'
endif
" }}}

" SuperTab continued plug-in settings {{{
" @url: http://www.vim.org/scripts/script.php?script_id=1643
" @git: https://github.com/ervandew/supertab.git
" @command: 
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
" }}}

" snipMate plug-in settings {{{
" @url: http://www.vim.org/scripts/script.php?script_id=2540
" @git: https://github.com/msanders/snipmate.vim.git
" @command: 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"inoremap <c-j> <c-r>=TriggerSnippet()<cr>
"snoremap <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>
" }}}

" PyFlakes plug-in settings {{{
" @url: http://www.vim.org/scripts/script.php?script_id=2441
" @git: https://github.com/kevinw/pyflakes-vim.git
" @command: 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:pyflakes_use_quickfix = 0 "default is 1
" }}}

" Pydiction plug-in settings {{{
" @url: http://www.vim.org/scripts/script.php?script_id=850
" @git: https://github.com/vim-scripts/Pydiction.git
" @command: <c-n>: show popmenu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pydiction_location = $VIMFILES.'/dict/python.dict'
" }}}

" nerdcommenter plug-in settings {{{
" @url: http://www.vim.org/scripts/script.php?script_id=1218
" @git: https://github.com/scrooloose/nerdcommenter.git
" @command: <leader>cc: NERDComComment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1
" }}}

" zencoding plug-in settings {{{
" @url: http://www.vim.org/scripts/script.php?script_id=2981
" @git: https://github.com/mattn/zencoding-vim.git
" @command: 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1
" }}}

" tagbar plug-in settings {{{
" @url: http://www.vim.org/scripts/script.php?script_id=3465
" @git: https://github.com/majutsushi/tagbar.git
" @command: 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>tb :TagbarToggle<cr>
if has("win32")
    let g:tagbar_ctags_bin = $VIMFILES.'\addons\ctags.exe'
elseif has("unix")
    let g:tagbar_ctags_bin = 'ctags'
endif
let g:tagbar_width = 30
" let g:tagbar_left = 1
" }}}
" }}}

" vim: set fdm=marker ft=vim ff=unix fenc=utf8:
