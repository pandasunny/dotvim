#dotvim

##Install on another machine

    cd ~
    git clone https://github.com/pandasunny/dotvim.git ~/.vim
    cd ~/.vim
    git submodule update --init

##Edit .vimrc(unix) or _vimrc(windows)

Set up **$VIMPATH**, **$VIMRC**, **$VIMFILES** and **$WORKSPACE** according to your OS.

For example:

    " Envionment variables settings {{{
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let $VIMPATH=$HOME
    let $VIMRC='.vimrc'
    let $VIMFILES=$HOME.'/.vim'
    let $WORKSPACE='~/workspace'
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " }}}
    source $VIMFILES/vimrc
    autocmd! bufwritepost $VIMRC source $VIMPATH/$VIMRC
    " Fast edit the vimrc with <leader>erc
    map <leader>erc :e! $VIMPATH/$VIMRC<cr>

##Install plugins as submodules

Find the vim plugins in https://github.com/vim-scripts

    cd ~/.vim
    git submodule add git://github.com/vim-scripts/mru.vim.git bundle/mru
    git add .
    git commit -m "Install plugins as submodules"

##Upgrading a plugin bundle

    cd ~/.vim/bundle/mru
    git pull

##Uninstall plugins as submodules

#####remove the plugins path

    git rm --cached bundle/mru
    rm -rf bundle/mru

#####delete the [submodule "path"] section from .git/config

    vim .git/config

#####delete the relevant line from .gitmodules

    vim .gitmodules

#####commit the .gitmodules

    git add .gitmodules
    git commit -m "Remove a submodule"

#####sync the submodule

    git submodule sync


