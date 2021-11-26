"取消兼容vi
set nocompatible
set backspace=indent,eol,start

"显示光标位置
set ruler
"设置 leader 为 ,
let mapleader=","
set timeoutlen=300
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

"Plugins 注释的是使用系统的包管理器安装了
call plug#begin('~/.vim/plugged')

" Plug 'preservim/nerdcommenter'
" Plug 'preservim/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'davidhalter/jedi-vim'
" Plug 'ryanoasis/vim-devicons'

call plug#end()

"重新映射 esc 按键
inoremap jj <esc>

nnoremap <leader>n :NERDTree <CR>
nnoremap <leader>l :!
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w<CR>
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

"jedi-vim 插件
autocmd FileType python setlocal completeopt-=preview
let g:pymode_rope = 0
let g:jedi#smart_auto_mappings = 1
let g:jedi#completions_command = "<TAB>"
let g:jedi#popup_on_dot=0
let g:jedi#usages_command = "<leader>u"

" neertree 插件
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

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


" vim-go 插件
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
