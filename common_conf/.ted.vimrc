
" Ted Wang's .vimrc, v0.03, 2019-09-17

" -----------------Ted Wang base settings-------------------
set fencs=utf-8,gbk,gb2312,gb18030,ucs-bom,cp936,latin1
set nu
set showcmd
set hls incsearch
set ts=4 sts=4 sw=4 et
set shiftwidth=4
set clipboard=unnamed
syntax on
"set nowrap
set hidden                          " Allow buffer switching without saving
set splitbelow                      " Let new horizontal split window(sp, new) below current window
set splitright                      " Let new vertical split window(vs, vne) right of current window
"set mouse=a                         " Enable switching between windows by mouse clicking.
set virtualedit=onemore             " Allow for cursor beyond last character
set nospell                         " Spell checking off, because it's impact Chinese characters a lot
set history=1000                    " default is 50 or 200 or etc...
set whichwrap=b,s,<,>,[,]           " 默认值是b,s 在行首按←或者在行尾按→是不能将光标移动至上一行或下一行的。
set modeline
set backspace=indent,eol,start      " 解决有些时候，backspace 键不能删除的问题。see :help 'backspace' for more description.

set viewoptions=folds,options,cursor,unix,slash   " Better Unix / Windows compatibility	----这行到底做了什么，得找机会试试

set noundofile                      " So is persistent undo ... enable this option will create a lots of temp files in ~/.vimundo/
let mapleader = ','
set autochdir                       " Always switch to the current file directory

silent function! OSX()
    return has('macunix')
endfunction
silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! MINGW()
    return has('unix') && !has('macunix') && has('win32unix')
endfunction
silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction

" the following piece if copied from spf13/.vimrc
if has('clipboard')
    if has('unnamedplus')           " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else                            " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" font settings
if has('gui_running')
    set guioptions-=T               " Remove the toolbar
    if LINUX()
        set guifont=Ubuntu\ Mono\ Regular\ 12,Monospace\ Regular\ 10,Noto\ Mono\ Regular\ 10,Noto\ Sans\ Mono\ Regular\ 10,Noto\ Sans\ Mono\ CJK\ SC\ Regular\ 10

    elseif OSX()
        set guifont=Ubuntu\ Mono\ Regular\ 12,Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
    elseif WINDOWS()
        set guifont=Ubuntu\ Mono Regular\ 12,Consolas:h10,Courier_New:h10,Courier\ New\ Regular\ 10
    endif
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256                " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
    "set term=builtin_ansi          " Make arrow and other keys work

    " 下面这个配置是为了让 git-bash 在 Conemu 里正常工作，具体原因见：https://conemu.github.io/en/VimXterm.html#Vim-scrolling-using-mouse-Wheel
    " 最好想办法检测当前是否运行在 Conemu 中
    if !WINDOWS()
        set term=xterm
    endif
endif

" colorscheme and cursor settings
if has('gui_running') && !OSX()
    if(&lines < 50)
        set lines=50
    endif
    if(&columns < 120)
        set columns=120
    endif
    set cursorline                  " Highlight current line
    colorscheme desert              " 使用经典的 desert 配色，综合来看，在 win/gvim，Linux/gvim，git-bash 里，效果都还不错。
elseif MINGW()                      " for vim in git-bash
    if(&lines < 50)
        set lines=50
    endif
    if(&columns < 120)
        set columns=120
    endif
    set cursorline                  " Highlight current line
    colorscheme default             " git-bash 里也使用 default，使用 git-bash 自带的 flat-ui 主题的效果更好
elseif LINUX()
    colorscheme default
     " do nonthing                  " Linux/Shell 里还是留空使用 terminal 的 theme 。
elseif OSX()
    set cursorline                  " Highlight current line
    colorscheme gruvbox             " 使用经典的 desert 配色，综合来看，在 win/gvim，Linux/gvim，git-bash 里，效果都还不错。
    set background=dark
elseif WINDOWS()
    if(&lines < 50)
        set lines=50
    endif
    if(&columns < 120)
        set columns=120
    endif
    set cursorline                  " Highlight current line
    colorscheme default             " windows cmd 使用 default，desert 在 powershell 下面高亮有问题，某些字符看不清。
endif

set ruler                                           " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)  " A ruler on steroids
" set format statusline. This option override the ruler?
set laststatus=2
set statusline=%<%f\%w%h%m%r\ [%{&ff}/%Y]\ [%{getcwd()}]%=%-14.(%=\:b%n%y%m%r%w\ %l,%c%V%)\ %p%%

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap W!! w !sudo tee > /dev/null %
" -----------------Ted Wang base settings end-------------------

" -----------------Ted Wang Optional settings-------------------
" autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif    " Always switch to the current file directory

" nmap <silent> <leader>/ :set invhlsearch<CR>
" nnoremap Y y$
" map <S-H> gT
" map <S-L> gt

" set list		" switch to show special characters/letters
" set listchars=tab:?\ ,trail:?,extends:#,nbsp:. " Highlight problematic whitespace

" Some helpers to edit mode http://vimcasts.org/e/14
" 这里把 %% 映射成展开当前目录，然后分别map了几种方式打开当前目录下的文件，同窗口多buffer，水平分割多窗口，垂直分割多窗口，多tab打开。
" ----但是这里:vsp 的行为有点奇怪，直接分割成横向3个，纵向2层的6个窗口，而且没要我回车确认
" cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
" map <leader>ew :e %%
" map <leader>es :sp %%
" map <leader>ev :vsp %%
" map <leader>et :tabe %%

" 终于找到 spf13 的color配置了，可惜是调用bundle的。。。。。遗憾
" if !exists('g:override_spf13_bundles') && filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
"     let g:solarized_termcolors=256
"     let g:solarized_termtrans=1
"     let g:solarized_contrast="normal"
"     let g:solarized_visibility="normal"
"     color solarized             " Load a colorscheme
" endif
" -----------------Ted Wang Optional settings end-------------------

