"取消兼容vi
set nocompatible
set backspace=indent,eol,start
"显示光标位置
set ruler
"调整后缀优先级
set suffixes+=.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set suffixes-=.h
set suffixes-=.obj

"设置 leader 为 ,
let mapleader=","
"重新映射 esc 按键
inoremap jj <esc>
" inoremap <esc> <nop>
"自动缩进
set autoindent
"将 tag 缩进改为 4 格
set tabstop=4
"将 tab 的缩进改为空格
set expandtab
"自动加载文件更改
set autoread
"开启光亮光标行
set cursorline
hi CursorLine   cterm=NONE
" hi CursorLine   cterm=underline ctermbg=darkred ctermfg=white
"高亮搜索结果
set hlsearch
"实时显示搜索结果
set incsearch
"未保存退出提示
set confirm
"显示命令
set showcmd
"高亮匹配符
set showmatch
"行尾空可见
"set listchars=tab:»■,trail:■
"set list
"语法高亮
filetype plugin on
syntax on 
"显示行号
set nu
"启用鼠标
set mouse=i
"拼写检查
"set spell
"跨行移动光标
"set whichwrap=b,s,<,>,[,]

"记录光标位置
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

"Taglist
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <leader>t :TlistToggle<CR>

"Plugins
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'frazrepo/vim-rainbow'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-commentary'

call plug#end()

"vim-plug 快捷键
nnoremap <leader>n :NERDTree <CR>
nnoremap <leader>i :PlugInstall<CR>
nnoremap <leader>c :PlugClean<CR>
nnoremap <leader>u :PlugUpdate<CR>
nnoremap <leader>l :!
nnoremap <leader>r :r !
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>e :ab email Clay Stan <claystan97@gmail.com><CR>i
"normal mode 下使用 c-k c-j 映射翻页
nnoremap <c-k> <c-b>
nnoremap <c-j> <c-f>
"insert mode 下映射光标移动
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"rainbow 配置文件
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
