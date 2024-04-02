" \   \  /   / |  | |       \ |   ____|
"  \   \/   /  |  | |  .--.  ||  |__
"   \      /   |  | |  |  |  ||   __|
"    \    /    |  | |  '--'  ||  |____
"     \__/     |__| |_______/ |_______|
"


vnoremap <Tab> zf     


" 在光标离开当前页面时自动保存文件
autocmd BufLeave * silent! write
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 在插入模式下自动插入括号，并将光标放在中间
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>


"shift + hjkl,新建终端
nnoremap <silent> <S-l> :botright vertical terminal<CR>
nnoremap <silent> <S-j> :botright terminal<CR>
nnoremap <silent> <S-k> :topleft termina<CR>
nnoremap <silent> <S-h> :vertical topleft terminal<CR>

" ctrl + hjkl,新建窗口
nnoremap <C-h> <C-w>h:vsp<CR>
nnoremap <C-j> <C-w>j:sp<CR>
nnoremap <C-k> <C-w>k:sp<CR>
nnoremap <C-l> <C-w>l:vsp<CR>



" Map Ctrl + 方向键 to switch cursor between windows
nnoremap <silent> <C-Up>    :wincmd k<CR>
nnoremap <silent> <C-Down>  :wincmd j<CR>
nnoremap <silent> <C-Left>  :wincmd h<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>


" F2 打开关闭 文件树木
nnoremap <F2> :NERDTreeToggle<CR>


call system('mkdir -p ~/.vimtmp/undodir ~/.vimtmp/backupdir ~/.vimtmp/directory')
colorscheme torte
filetype on
filetype plugin indent on
filetype plugin on
let g:is_bash=1
let $VIMFILES=$HOME.'/.vim'
let @w = 'x~n'
nmap <c-l> <esc>:noh<cr>
nmap <leader>3 :NERDTreeFind<cr>
nmap <leader>a :set filetype=awk        <CR>
nmap <leader>c :set filetype=css        <CR>
nmap <leader>d :set filetype=htmldjango <CR>
nmap <leader>e :set filetype=sed        <CR>
nmap <leader>g :set filetype=go         <CR>
nmap <leader>h :set filetype=html       <CR>
nmap <leader>j :set filetype=javascript <CR>
nmap <leader>l :set filetype=lua        <CR>
nmap <leader>m :set filetype=markdown   <CR>
nmap <leader>p :set filetype=php        <CR>
nmap <leader>s :set filetype=sh         <CR>
nmap <leader>t :set filetype=txt        <CR>
nmap <leader>v :set filetype=vim        <CR>
nmap <leader>y :set filetype=python     <CR>

set backspace=indent,eol,start
set clipboard=unnamedplus
set mouse=a
set relativenumber
set ambiwidth=double
set autoread
set autowriteall
set backup
set bs+=start
set smartindent cindent autoindent
set shiftwidth=4 tabstop=4 smarttab
set complete-=i
set cursorline

set expandtab
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936 fileencoding=utf-8
set foldmethod=manual
set hidden hlsearch
set ignorecase smartcase
set noautochdir
set noshowmatch
set nowrapscan
set number
set pastetoggle=<F5>
set path+=./model/,./ctrl/,./lib/,*/templates/,*/static/,..,*/src/main/java/
set printoptions=formfeed:y,header:0,paper:A4,duplex:off,syntax:n
set scrolloff=1
set shell=/bin/bash
set nocompatible
set showcmd                                 " Show cmd in vim-cmdline.
set t_Co=256                                " Make vim look better in putty.
set textwidth=0
set undodir=~/.vimtmp/undodir
            \ directory=~/.vimtmp/directory
            \ backupdir=~/.vimtmp/backupdir
            \ viewdir=~/.vimtmp/view
            \ undofile
set vb t_vb=                                " Turn off bi-sound of vim.
set wildignore+=*.git\\*,*.tgz,*.zip,*.url,*.pyc,*.class
set wrap linebreak
set incsearch
syntax on

"
"" statusline
"
function Version ()
    return system("grep -o '^v[0-9]*' ~/.vim/version|tr -d '\n'")
endfunction
set laststatus=2
set statusline=(Vide.%{Version()})\ \ %<%f
set statusline+=%w%h%m%r
set statusline+=\ %{getcwd()}
set statusline+=\ [%{&ff}:%{&fenc}:%Y]
set statusline+=%=%-14.(%l,%c%V%)\ %p%%

"
" vim-plug
"
call plug#begin('~/.vim/plug')
Plug 'wgwoods/vim-systemd-syntax'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'vim-syntastic/syntastic'
Plug 'xavierd/clang_complete'
Plug 'tomasiser/vim-code-dark'
call plug#end()

let g:clang_library_path='/usr/lib/llvm-14/lib/libclang-14.so.1'

"
" syntastic
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_quiet_messages = { "level": "errors" }
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"

" NERDTree
"
let g:NERDTreeDirArrowExpandable  = '@'
" let g:NERDTreeNodeDelimiter       = "\u00a0"
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeShowHidden          = 0
let g:NERDTreeBookmarksFile       = $HOME.'/.vimtmp/NerdBookmarks.txt'
let g:NERDTreeShowBookmarks       = 1
let g:NERDTreeShowFiles           = 1
let g:NERDTreeShowLineNumbers     = 0
let g:NERDTreeWinSize             = 29
let g:NERDTreeMinimalUI           = 1
let g:NERDTreeDirArrows           = 1
let g:NERDTreeIgnore              = [
            \ '.*\.class',
            \ '.*\.pyc',
            \ '.*\.chm',
            \ '.*\.ttf',
            \ '.*\.lnk',
            \ '.*\.cproj',
            \ '.*\.exe',
            \ '.*\.dll',
            \ '.*\.out',
            \ '.*\.files',
            \ '.*\.zip',
            \ '.*\.rar',
            \ '.*\.gif'
            \ ]
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }

"
" ctrlp
"
" Making CtrlP.vim load 100x faster — A Tiny Piece of Vim — Medm
" https://medium.com/a-tiny-piece-of-vim/making-ctrlp-vim-load-100x-faster-7a722fae7df6#.emcvo89nx
let g:ctrlp_user_command = [
            \ '.git/',
            \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard'
            \ ]
let g:ctrlp_match_window       = 'bottom,order:btt,min:5,max:5,results:10'
let g:ctrlp_cmd                = 'CtrlPMixed'
let g:ctrlp_mruf_default_order = 1

"
" utime.vim
"
let g:timeStampFormat = '170101'
let g:timeStampString = '%y%m%d'
let g:timeStampLeader = 'version'



colorscheme codedark
