"选中块折叠
vnoremap <Tab> zf     

" 光标
" 打开文件恢复到上一次光标位置，并置顶
" 光标从窗口中转移，自动保存
autocmd BufReadPost * execute "normal! " . line("'\"") . "Gzt"
autocmd BufLeave * silent! write

" 折叠保存
autocmd BufWinLeave * mkview
autocmd BufWinEnter * silent loadview

" 窗口
" ctrl + hjkl,新建窗口
" Map Ctrl + 方向键 ,切换光标聚焦窗口
nnoremap <silent> <C-Up>    :wincmd k<CR>
nnoremap <silent> <C-Down>  :wincmd j<CR>
nnoremap <silent> <C-Left>  :wincmd h<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

tnoremap <C-Up> <C-\><C-N>
tnoremap <C-Down> <C-\><C-N>
tnoremap <C-Left> <C-\><C-N>
tnoremap <C-Right> <C-\><C-N>

" 不备份
set noswapfile

" 鼠标，剪切板
set clipboard=unnamedplus
set mouse=a

" 查找时高亮
set incsearch
set nowrapscan    " 禁用跨越文件的搜索

" Tab，缩进
" Tab自动转化4空格，自动缩进
set shiftwidth=4 tabstop=4 smarttab
set expandtab
set smartindent cindent autoindent

" 编码
" 自动转化utf-8，中文字符占两格
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936 fileencoding=utf-8
set ambiwidth=double

" 外观
" 设置左侧行号，绝对和相对
" 设置颜色
" 设置下划线
set number
set t_Co=256                                " Make vim look better in putty.
set termguicolors
set hlsearch
set relativenumber

" 退格
set backspace=indent,eol,start

" 文本
" 不限长
set textwidth=0
set wrap linebreak

" 自动读写
set autoread
set autowriteall

" 杂项
set foldmethod=manual
set ignorecase smartcase
set showcmd                                 " Show cmd in vim-cmdline.
set noerrorbells

" 插件
" 代码补全,文件数，vscode主题 缩进对齐
call plug#begin('~/.vim/plug')
Plug 'ku1ik/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
call plug#end()

" 缩进对齐
let g:indentLine_enabled = 1			" 使插件生效
let g:indentLine_char = '¦'				" 设置缩进线字符，也可以为 '|', '┆', '┊' 等

let g:coc_global_extensions = ['coc-snippets', 'coc-highlight', 'coc-lists', 'coc-json', 'coc-clangd', 'coc-html', 'coc-pyright', 'coc-tsserver' ]

" 代码补全的快捷键
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1)  : "\<Tab>"
inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <F2> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" tagbar设置
nmap <F3> :TagbarToggle<CR>

" vscode外观
colorscheme monokai






