" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
	syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
	filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
	source /etc/vim/vimrc.local
endif

"acky
"set mouse=a
call pathogen#infect()
set t_Co=256
"set guifont=Luxi\ Mono\ 9
set guifont=Source\ Code\ Pro\ Semibold:h9
let g:solarized_termcolors=256
colorscheme solarized
let g:Powerline_symbols = 'fancy'
set hlsearch
set encoding=utf-8 termencoding=gbk
set so=7 "移动时到底部或顶部还有七行
set helplang=cn
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=T  "去掉工具条
"set guioptions-=m " 隐藏菜单栏
set guioptions-=L " 隐藏左侧滚动条
set guioptions-=r " 隐藏右侧滚动条
set guioptions-=b " 隐藏底部滚动条
""""""""""""""""""""""""""""""""""""""""""
"Gvim 乱码的设置
set fileencodings=utf-8,chinese,latin-1
if has("win32")
	set fileencoding=chinese
else
	set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8
"Gvim 乱码的设置结束
"""""""""""""""""""""""""""""""""""""""""""""""
" Alt+数字切换Table快捷键设置

:nn <M-1> 1gt
:nn <M-2> 2gt
:nn <M-3> 3gt
:nn <M-4> 4gt
:nn <M-5> 5gt
:nn <M-6> 6gt
:nn <M-7> 7gt
:nn <M-8> 8gt
:nn <M-9> 9gt
:nn <M-0> :tablast<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"
" Platform
function! MySys()
	if has("win32")
		return "windows"
	else
		return "linux"
	endif
endfunction

"NERDTree
map <F9> :NERDTreeToggle<CR>

au FileType phtml,php,c,java,javascript,html,htm,smarty call SetOption()
function! SetOption()
	set expandtab    " 使用空格代替tab
	set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
	set tabstop=4    " 用4个空格代替1个tab
	set sts=4        " 设置softtabstop 为 4，输入tab后就跳了4格.
	set cindent      " C语言方式缩进
	set smartindent  " 智能缩进
	set autoindent   " 自动缩进
	set smarttab     " 只在行首用tab，其他地方的tab都用空格代替
	set showmatch    " 在输入括号时光标会短暂地跳到与之相匹配的括号处
	"  set fdm=indent " 代码折叠
	set lbr
	set tw=500
	set wrap         " 自动换行
	set number
	set fdm=syntax
	set fen 
	if !exists('g:AutoComplPop_Behavior') 
		let g:AutoComplPop_Behavior = {} 
		let g:AutoComplPop_Behavior['php'] = [] 
		call add(g:AutoComplPop_Behavior['php'], { 
					\   'command'   : "\<C-x>\<C-o>", 
					\   'pattern'   : printf('\(->\|::\|\$\)\k\{%d,}$', 0), 
					\   'repeat'    : 0, 
					\}) 
	endif 

	" 打开javascript折叠
	let b:javascript_fold=1

	" 打开javascript对dom、html和css的支持
	let javascript_enable_domhtmlcss=1

	"jQuery plugin 
	au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

	let g:html_indent_script1 = "inc" 
	let g:html_indent_style1 = "inc"
	let g:html_indent_inctags = "html,body,head,tbody"

endfunction

au FileType phtml,html,htm,smarty call SetOptionForHtml()
function! SetOptionForHtml()
	set shiftwidth=2 " 设定 << 和 >> 命令移动时的宽度为 2 
	set tabstop=2    " 用2个空格代替1个tab
	set sts=2        " 设置softtabstop 为 2，输入tab后就跳了2格.
endfunction

"phpcomplete
filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


au BufNewFile,BufRead *.php,*.php\d,*.phtml,*.ctp,*.inc setf php

" => Plugin configuration

set directory=$VIM\vimfiles\temp,~/tmp,/tmp,D:\tmp

" taglist
if MySys() == "windows"  
	let Tlist_Ctags_Cmd = 'ctags'  
elseif MySys() == "linux"  
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'  
endif  

let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 1
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1 
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
map <F10> :TlistToggle<CR>

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf


"let g:ackprg="ack-grep -H --nocolor --nogroup --column --smart-case"

"php-doc
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

"ctags 
set tags=./tags;
"set tags=tags;
"set autochdir
"set tags=/usr/include/tags,./tags,./..tags,./**/tags
"set tags=tags
"set tags+=./tags        " add current directory's generated tags file
"
"cscpoe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
	if MySys() == "windows"  
		set csprg=cscope
	elseif MySys() == "linux"  
		set csprg=/usr/bin/cscope
	endif  
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif

"SuperTab
"Old setting
let g:SuperTabMappingForward="<tab>" 
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType ="<C-X><C-U>"
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"
""let g:SuperTabDefaultCompletionType = "context"

let g:syntastic_check_on_open=1
"phpcs，tab 4个空格，编码参考使用CodeIgniter风格
let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"

""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
let g:LookupFile_TagExpr = '"./filenametags"'

""映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
""映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
""映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>

"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_min_syntax_length = 3
let g:NeoComplCache_DisableAutoComplete = 1
