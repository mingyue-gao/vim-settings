"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This vimrc is based on the vimrc by Amix:
"       http://amix.dk/vim/vimrc.html
" You can find the latest version on:
"       http://github.com/easwy/share/tree/master/vim/vimrc/
"
" Maintainer:  Easwy Yang
" Last Change: Mon Oct 25 16:04:31 CST 2010
" Homepage:    http://easwy.com/
" Version:     0.2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible        " be iMproved, required by Vundle
filetype off            " required by Vundle

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Sets how many lines of history VIM har to remember
set history=256

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"Super paste
"inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
"make all yanking/deleting operations automaticlly copy to the system clipboard.
"set clipboard=unnamedplus
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+p

"Enable filetype plugin
filetype plugin on
filetype indent on
filetype plugin indent on    " required by Vundle


"Set to auto read when a file is changed from the outside
set autoread

"Set j, k to move regardless of one line or two
map j gj
map k gk
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

"Have the mouse enabled all the time:
"set mouse=a

nmap <leader>sc :source ~/.vimrc<cr>

"Fast saving
nmap <silent> <leader>ww :w<cr>
nmap <silent> <leader>wf :w!<cr>

"Fast quiting
nmap <silent> <leader>qw :wq<cr>
nmap <silent> <leader>qf :q!<cr>
nmap <silent> <leader>qq :q<cr>
nmap <silent> <leader>qa :qa<cr>

"Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>

" Platform
function! MySys()
  if has("win32")
    return "windows"
  else
    return "linux"
  endif
endfunction


" Always use English messages & menu
"language zh_CN.UTF-8
"language messages en_US.ISO_8859-1
"set langmenu=en_US.ISO_8859-1

" Chinese
" multi-encoding setting
if has("multi_byte")
  "set bomb 
  set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,sjis,euc-kr,ucs-2le,latin1 
  " CJK environment detection and corresponding setting 
  if v:lang =~ "^zh_CN" 
    " Use cp936 to support GBK, euc-cn == gb2312 
    set encoding=chinese 
    set termencoding=chinese 
    set fileencoding=chinese 
  elseif v:lang =~ "^zh_TW" 
    " cp950, big5 or euc-tw 
    " Are they equal to each other? 
    set encoding=taiwan 
    set termencoding=taiwan 
    set fileencoding=taiwan 
  endif 
  " Detect UTF-8 locale, and replace CJK setting if needed 
  if v:lang =~ "utf8$" || v:lang =~ "UTF-8$" 
    set encoding=utf-8 
    set termencoding=utf-8 
    set fileencoding=utf-8 
  endif 
endif 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Set font
if MySys() == "linux"
  if has("gui_gtk2")
    set gfn=Courier\ New\ 10,Courier\ 10,Luxi\ Mono\ 10,
          \DejaVu\ Sans\ Mono\ 10,Bitstream\ Vera\ Sans\ Mono\ 10,
          \SimSun\ 10,WenQuanYi\ Micro\ Hei\ Mono\ 10
  elseif has("x11")
    set gfn=*-*-medium-r-normal--10-*-*-*-*-m-*-*
  endif
endif

" Avoid clearing hilight definition in plugins
if !exists("g:vimrc_loaded")
    "Enable syntax hl
    syntax enable

    " color scheme
    if has("gui_running")
        set guioptions-=T
        set guioptions-=m
        set guioptions-=L
        set guioptions-=r
        colorscheme darkblue_my
        "hi normal guibg=#294d4a
        set cursorline
    else
        colorscheme desert_my
    endif " has
endif " exists(...)

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=c<cr>
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>

autocmd BufEnter * :syntax sync fromstart


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
set ffs=unix,dos

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
"set so=7

" Maximum window when GUI running
"if has("gui_running")
"  "set lines=9999
"  "set columns=9999
"endif

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=2

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
"set hid

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
"set whichwrap+=<,>,h,l
set whichwrap+=<,>

"Ignore case when searching
set ignorecase

"Include search
set incsearch

"Highlight search things
set hlsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novb t_vb=

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
"Always hide the statusline
set laststatus=2

function! CurDir()
  let curdir = substitute(getcwd(), '/home/moon/', "~/", "g")
  return curdir
endfunction

"Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c



""""""""""""""""""""""""""""""
" Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"Actually, the tab does not switch buffers, but my arrows
"Bclose function can be found in "Buffer related" section
map <leader>bd :Bclose<cr>
"map <down> <leader>bd

"Tab configuration
map <leader>tn :tabnew
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
try
  set switchbuf=useopen
  set stal=1
catch
endtry

"Switch to current dir
map <silent> <leader>cd :cd %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap @1 <esc>`>a)<esc>`<i(<esc>
"")
vnoremap @2 <esc>`>a]<esc>`<i[<esc>
vnoremap @3 <esc>`>a}<esc>`<i{<esc>
vnoremap @$ <esc>`>a"<esc>`<i"<esc>
vnoremap @q <esc>`>a'<esc>`<i'<esc>
vnoremap @w <esc>`>a"<esc>`<i"<esc>

"Map auto complete of (, ", ', [
inoremap @1 ()<esc>:let leavechar=")"<cr>i
inoremap @2 []<esc>:let leavechar="]"<cr>i
inoremap @3 {}<esc>:let leavechar="}"<cr>i
inoremap @4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap @q ''<esc>:let leavechar="'"<cr>i
inoremap @w ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i

imap <m-l> <esc>:exec "normal f" . leavechar<cr>a
imap <d-l> <esc>:exec "normal f" . leavechar<cr>a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  nohl
  exe "normal `z"
endfunc

" do not automaticlly remove trailing whitespace
"autocmd BufWrite *.[ch] :call DeleteTrailingWS()
"autocmd BufWrite *.cc :call DeleteTrailingWS()
"autocmd BufWrite *.txt :call DeleteTrailingWS()
nmap <silent> <leader>ws :call DeleteTrailingWS()<cr>:w<cr>
"nmap <silent> <leader>ws! :call DeleteTrailingWS()<cr>:w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Open a dummy buffer for paste
map <leader>es :tabnew<cr>:setl buftype=nofile<cr>
if MySys() == "linux"
map <leader>ec :tabnew /tmp/scratch.txt<cr>
else
map <leader>ec :tabnew $TEMP/scratch.txt<cr>
endif

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set sessionoptions-=curdir
set sessionoptions+=sesdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
"set fen
"set fdl=
"nmap <silent> <leader>zo zO
"vmap <silent> <leader>zo zO


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>
au FileType html,python,vim,javascript,xml setl shiftwidth=2
"au FileType html,python,vim,javascript setl tabstop=2
"au FileType java,c,cpp setl shiftwidth=4
"au FileType java setl tabstop=4
au FileType txt setl lbr
au FileType txt setl tw=78

set smarttab
"set lbr
"set tw=78

   """"""""""""""""""""""""""""""
   " Indent
   """"""""""""""""""""""""""""""
   "Auto indent
   set ai

   "Smart indet
   set si

   "C-style indeting
   set cindent
   autocmd FileType python setlocal foldmethod=indent smartindent shiftwidth=2 ts=2 et cinwords=if,elif,else,for,while,try,except,finally,def,class

   "Wrap lines
   set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" options
set completeopt=menu
set complete-=u
set complete-=i

" mapping
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"
inoremap <C-]>             <C-X><C-]>
inoremap <C-F>             <C-X><C-F>
inoremap <C-D>             <C-X><C-D>
inoremap <C-L>             <C-X><C-L>

" Enable syntax
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \if &omnifunc == "" |
        \  setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/stl3.3
"set tags+=~/.vim/tags/stdcpp
"set tags+=~/.vim/tags/vires
"set tags+=~/.vim/tags/open_scene_graph.3.2.1
"
"set tags+=~/.vim/tags/QT/qt4
"" build tags of your own project with Ctrl-F12
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"-- omniCppComplete --

"let OmniCpp_MayCompleteDot = 1 " autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
"let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
""-- optional 
"" auto close options when exiting insert mode
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"set completeopt=menu,menuone
"-- end of omniCppComplete
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle and plugins configuration BEGIN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'msanders/snipmate.vim'

" syntastic is not required by YCM right now.
"Plugin 'scrooloose/syntastic'

Plugin 'vim-scripts/a.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'tpope/vim-surround'

Plugin 'vim-scripts/YankRing.vim'

Plugin 'vim-scripts/DoxygenToolkit.vim'

Plugin 'hynek/vim-python-pep8-indent'


" vim-airline: a fancy statu bar 
"Plugin 'bling/vim-airline'

Plugin 'altercation/vim-colors-solarized'


" All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle

"""""""""""""""""""""""""""""""""""""""""
" You Complete Me setting
"""""""""""""""""""""""""""""""""""""""""
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_confirm_extra_conf = 0
let g:ycm_cache_omnifunc = 0 
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_open_loclist_on_ycm_diags = 1
" disable <TAB> select next item in the pop-up window
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<UP>']


nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""
" SnipMate
""""""""""""""""""""""""""""""
let g:snips_author = 'Mingyue Gao'
let g:snippets_dir = '~/.vim/bundle/snipmate.vim/mysnippets'

""""""""""""""""""""""""""""""
" NERDTree setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>tt :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""
" A.vim  setting
""""""""""""""""""""""""""""""
let g:alternateExtensions_cc  = "inc,h,hh,H,hpp,HPP"
let g:alternateExtensions_c   = "inc,h,hh,H,hpp,HPP"
let g:alternateExtensions_cpp = "inc,h,hh,H,hpp,HPP"
let g:alternateExtensions_hh  = "cc,cpp,cxx,c"
let g:alternateExtensions_hpp = "cc,cpp,cxx,c"

"""""""""""""""""""""""""""""""
" Yank Ring setting
""""""""""""""""""""""""""""""
let g:yankring_enabled=1
let g:yankring_history_file='.yankring_history_file'
map <leader>yr :YRShow<cr>

"""""""""""""""""""""""""""""""
" Yank Ring setting
""""""""""""""""""""""""""""""
"let g:DoxygenToolkit_commentType = "C++"
" author info
"g:DoxygenToolkit_authorName = 'Gao Mingyue, mingyue.gao@vires.com'
nmap <leader>dg :Dox<cr>
nmap <leader>dga :DoxAuthor<cr>
" license announcement
nmap <leader>dgl :DoxLic<cr>

"""""""""""""""""""""""""""""""
" air line setting
"""""""""""""""""""""""""""""""

"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme = 'solarized'
"let g:airline#extensions#tabline#left#sep = '> '
"let g:airline#extensions#tabline#left#alt#sep = '|'
"let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
"let g:airline#extensions#quickfix#location_text = 'Location'

""""""""""""""""""""""""""""""""
" vim color solarized setting
""""""""""""""""""""""""""""""""
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle and plugins configuration END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if has("cscope")
"  if MySys() == "linux"
"    set csprg=/usr/local/bin/cscope
"  else
"    set csprg=cscope
"  endif
"  set csto=1
"  set cst
"  set nocsverb
"  " add any database in current directory
"  if filereadable("cscope.out")
"      cs add cscope.out
"  endif
"  set csverb
"endif
"
"nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>


" Hitting CTRL-space *twice* before the search type does a vertical 
" split instead of a horizontal one (vim 6 and up only)
"
" (Note: you may wish to put a 'set splitright' in your .vimrc
" if you prefer the new window on the right instead of the left

"nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>   
"nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>     
"nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " Todo
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   "au BufNewFile,BufRead *.todo so ~/vim_local/syntax/amido.vim

   """"""""""""""""""""""""""""""
   " HTML related
   """"""""""""""""""""""""""""""
   " HTML entities - used by xml edit plugin
   let xml_use_xhtml = 1
   "let xml_no_auto_nesting = 1

   "To HTML
   let html_use_css = 1
   let html_number_lines = 0
   let use_xhtml = 1

   """""""""""""""""""""""""""""""
   " Vim section
   """""""""""""""""""""""""""""""
   autocmd FileType vim set nofen
   autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

   """"""""""""""""""""""""""""""
   " HTML
   """""""""""""""""""""""""""""""
   au FileType html set ft=xml
   au FileType html set syntax=html


   """"""""""""""""""""""""""""""
   " C/C++
   """""""""""""""""""""""""""""""
   autocmd FileType c,cc,cpp,xml  map <buffer> <leader><space> :make<cr>
   "autocmd FileType c,cpp  setl foldmethod=syntax | setl fen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   "Quickfix
   nmap <leader>cn :cn<cr>
   nmap <leader>cp :cp<cr>
   nmap <leader>cw :botright cw<cr>
   nmap <leader>cc :ccl<cr>
   "nmap <leader>cc :botright lw 10<cr>
   "map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>

   " auto bottom right the location list window
   autocmd FileType qf wincmd J

   function! s:GetVisualSelection()
       let save_a = @a
       silent normal! gv"ay
       let v = @a
       let @a = save_a
       let var = escape(v, '\\/.$*')
       return var
   endfunction

   " Fast grep
   nmap <silent> <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
   vmap <silent> <leader>lv :lv /<c-r>=<sid>GetVisualSelection()<cr>/ %<cr>:lw<cr>

   " Fast diff
   "cmap @vd vertical diffsplit 
   set diffopt+=vertical

   "Remove the Windows ^M
   noremap <Leader>dm mzHmx:%s/<C-V><cr>//ge<cr>'xzt'z:delm x z<cr>


   "Remove indenting on empty lines
   "map <F2> :%s/\s*$//g<cr>:noh<cr>''


   "Fast Ex command
   "nnoremap ; :

   "For mark move
   "nnoremap <leader>' '

   "Fast copy
   "nnoremap ' "


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mark as loaded
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrc_loaded = 1


