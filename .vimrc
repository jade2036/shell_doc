" Install 
" 1. Set up Vundle:
"    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 2. To install from command line: vim +PluginInstall +qall


" mac coding "{{{
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" }}}

" General "{{{
set nocompatible  " disable vi compatibility.
set history=100 	
set autowrite  " Writes on make/shell commands
set autoread  
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed  " Yanks go on clipboard instead.

" Backup
set nowritebackup
set nobackup 
set noswapfile 

" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase   " be sensitive when there's a capital letter
set incsearch   
set ignorecase " search ignore case

" show status line
" set statusline=%2*%n%m%r%h%w%*\ %F\ %1*[FORMAT=%2*%{&ff}:%{&fenc!=''?&fenc:&enc}%1*]\ [TYPE=%2*%Y%1*]\ [COL=%2*%03v%1*]\ [ROW=%2*%03l%1*/%3*%L(%p%%)%1*]\
" set laststatus=2
set number

set ruler " show the cursor position all the time 
set showcmd

" php syntax function
set dictionary+=~/.vim/php_functions.txt
set complete-=k complete+=k

colorscheme default
"set background=dark

set backspace=indent,eol,start

set grepprg=grep\ $*\ ./\ -inR\ --color
"set grepformat=%f:%l:%c:%m
" }}}

" Formatting "{{{
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0		" Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start	" more powerful backspacing

set tabstop=4    " Set the default tabstop
set softtabstop=2
set shiftwidth=4 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case

syntax on               " enable syntax
filetype plugin indent on             " Automatically detect file types.
" " }}}

" Key mappings "{{{
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
map <F3> :tabnew<CR>
map <F4> :shell<CR>
map <F5> :call CompileRun()<CR>
map <F12> gg=G


nmap <leader>w :w!<cr>
nmap <leader>wq :wq!<cr>
nmap <leader>f :find<cr>
"ctrl+a select all and copy
map <C-A> ggVGY 
map! <C-A> <Esc>ggVGY

map <C-N> :tabn<CR>
map <C-P> :tabp<CR>
map <C-J> :!php -l %<CR>
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

" " }}}

" Function "{{{
func! CompileRun()
	exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    elseif &filetype == 'php'
		!php -l %
    endif
endfunc

function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endfunction

" }}}

" Command "{{{
comm! W exec 'w !sudo tee % > /dev/null' | e!

"Auto commands
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}                                set ft=gitcommit

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file
" "}}}

" Plugins " {{{
" https://github.com/VundleVim/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"vim-commentary
Plugin 'tpope/vim-commentary'
autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType php setlocal commentstring=//\ %s

"NERDTree
Plugin 'scrooloose/nerdtree'
"autocmd VimEnter * NERDTree
map <F1> :NERDTreeToggle<CR>
map <C-F1> :NERDTreeFind<CR>
let NERDTreeChDirMode=2  "选中root即设置为当前目录
let NERDTreeQuitOnOpen=1 "打开文件时关闭树
let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeMinimalUI=1 "不显示帮助面板
let NERDTreeDirArrows=0 "目录箭头 1 显示箭头  0传统+-|号

"syntastic
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" git
Plugin 'airblade/vim-gitgutter'

Plugin 'mkitt/tabline.vim'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#buffer_nr_show = 1

Plugin 'python-mode/python-mode'

" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
set nofoldenable
let g:vim_markdown_folding_level = 6 



Plugin 'posva/vim-vue'
au BufRead,BufNewFile *.vue set filetype=vue

Plugin 'ervandew/supertab'
Plugin 'bogado/file-line'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/snipMate'
Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plugin 'IN3D/vim-raml'
" Plugin 'kiith-sa/DSnips'
call vundle#end()
" "}}}
"
autocmd FileType vue syntax sync fromstart
