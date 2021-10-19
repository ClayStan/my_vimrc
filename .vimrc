"取消兼容vi
set nocompatible
set backspace=indent,eol,start

"显示光标位置
set ruler
"设置 leader 为 ,
let mapleader=","
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

Plug 'preservim/nerdcommenter'
Plug 'Raimondi/delimitMate'

call plug#end()

"重新映射 esc 按键
inoremap jj <esc>

nnoremap <leader>l :!
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

"光标移动到行尾映射
nnoremap - $

"取消 q 的映射(cmd line window && recording
nnoremap q <Nop>
