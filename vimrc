"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This vimrc is based on the vimrc by Amix:
"       http://amix.dk/vim/vimrc.html
"
" Maintainer:  Mingyue Gao
" Last Change: Mon Sept 25 16:04:31 CST 2016
" Homepage:    http://www.mingyue.de
" Version:     0.5
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Predefined global settings
" Could be overwritten by plugins
"
" - General settings
" 
" * Get out of VI's compatible mode (required by Vundle)
set nocompatible        

" * Set mapleader
let mapleader = ","
let g:mapleader = ","

" * Set to auto read when a file is changed from the outside
set autoread

" * Sets how many lines of history VIM har to remember
set history=256

" * Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

" * Set backspace
set backspace=eol,start,indent

" * set whichwrap+=<,>,h,l
set whichwrap+=<,>

" * Ignore case when searching
set ignorecase

" * Include search
set incsearch

" * Highlight search things
set hlsearch

" * Set magic on
set magic

" * No sound on errors.
set noerrorbells
set novb t_vb=

" * disable the preview window for completion
set completeopt-=preview

" - Session options
set sessionoptions-=curdir
set sessionoptions+=sesdir

" - Files and backups
" * Turn backup off
set nobackup
set nowb
set noswapfile

" - Text options
set shiftwidth=4

" * replace tab to spaces
set expandtab           

" * in front of a line inserts blanks accordinng to 'shiftwidth'
set smarttab            

" - Indent options
" * Auto indent
set autoindent

" * Smart indent
set smartindent

" * C-style indeting
set cindent

" * Wrap lines
set wrap

" - Favorite filetypes
set ffs=unix,dos

" - File type options
autocmd FileType python setlocal foldmethod=indent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType html,vim,javascript,xml setlocal shiftwidth=2
autocmd FileType txt setlocal lbr
autocmd FileType txt setlocal tw=78

" * VIM 
autocmd FileType vim set nofen
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

" * C/C++
autocmd FileType c,cc,cpp,xml  map <buffer> <leader><space> :make<cr>

" * HTML 
"   HTML entities - used by xml edit plugin
let xml_use_xhtml = 1
"let xml_no_auto_nesting = 1

"   To HTML
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1
autocmd FileType html set ft=xml
autocmd FileType html set syntax=html

" - How VIM looks
" * Turn on WiLd menu
set wildmenu

" * Always show current position
set ruler

" * The commandbar is 2 high
set cmdheight=2

" * Show line number
set nu

" * Do not redraw, when running macros.. lazyredraw
set lz

" * Always show the statusline
set laststatus=2

function! CurDir()
  let curdir = substitute(getcwd(), '/home/moon/', "~/", "g")
  return curdir
endfunction

" * Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

" - Platform
function! MySys()
  if has("win32")
    return "windows"
  else
    return "linux"
  endif
endfunction

" - multi-encoding setting
" * Chinese
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle and plugins configuration BEGIN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off            " required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'msanders/snipmate.vim'
"Plugin 'SirVer/ultisnips'

Plugin 'vim-scripts/a.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'tpope/vim-surround'

Plugin 'vim-scripts/YankRing.vim'

Plugin 'vim-scripts/DoxygenToolkit.vim'

Plugin 'hynek/vim-python-pep8-indent'

" vim-airline: a fancy statu bar 
"Plugin 'bling/vim-airline'

Plugin 'altercation/vim-colors-solarized'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'


" All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle

"Enable filetype plugin
filetype plugin on
filetype indent on
"filetype plugin indent on    " required by Vundle

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

nnoremap <leader>gf :YcmCompleter GoToDefination<CR>
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>

""""""""""""""""""""""""""""""
" SnipMate
""""""""""""""""""""""""""""""
let g:snips_author = 'Mingyue Gao'
let g:snippets_dir = '~/.vim/mydata/snipmate'

""""""""""""""""""""""""""""""
" UltiSnips
""""""""""""""""""""""""""""""
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
""let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetsDir="~/.vim/mydata/ultisnips"

""""""""""""""""""""""""""""""
" NERDTree setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>tt :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""
" A.vim  setting
""""""""""""""""""""""""""""""
let g:alternateExtensions_h = "c,cpp,cxx,cc,CC"
let g:alternateExtensions_hh = "cc,cpp,cxx,c"
let g:alternateExtensions_H = "C,CPP,CXX,CC"
let g:alternateExtensions_hpp = "cxx,cpp,cc,c"
let g:alternateExtensions_cpp = "h,hpp,hh"
let g:alternateExtensions_CPP = "H,HPP"
let g:alternateExtensions_c = "h"
let g:alternateExtensions_C = "H"
let g:alternateExtensions_cc  = "hh,HH,h,H,hpp,HPP"
let g:alternateExtensions_cxx = "hpp,h,hh,hPP,H"

let g:alternateSearchPath = 'sfr:impl,sfr:../src,sfr:../inc,sfr:../include'

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

""""""""""""""""""""""""""""""""
" vim sesstions
""""""""""""""""""""""""""""""""
" Don't save hidden and unloaded buffers in sessions.
set sessionoptions-=buffers
let g:session_directory='~/.vimlocal/sessions'
let g:session_autoload='no'
let g:session_autosave='yes'
let g:session_autosave_periodic=3
"let g:session_autosave_silent=1
nmap <leader>ss :SaveSession<cr>
nmap <leader>so :OpenSession<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle and plugins configuration END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom settings 
" Overwrite those set up by Plugins
"
" - Remaps
" * Super paste
"inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
"make all yanking/deleting operations automaticlly copy to the system clipboard.
"set clipboard=unnamedplus
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+p

" * Set j, k to move regardless of one line or two
map j gj
map k gk
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

nmap <leader>sc :source ~/.vimrc<cr>

" * Fast saving
nmap <silent> <leader>ww :w<cr>
nmap <silent> <leader>wf :w!<cr>

"* Fast quiting
nmap <silent> <leader>qw :wq<cr>
nmap <silent> <leader>qf :q!<cr>
nmap <silent> <leader>qq :q<cr>
nmap <silent> <leader>qa :qa<cr>

"* Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>

" * Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=c<cr>
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>

autocmd BufEnter * :syntax sync fromstart

" *  Fileformats
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

" - Visual
" * From an idea by Michael Naumann
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

" * Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" * Actually, the tab does not switch buffers, but my arrows
"   Bclose function can be found in "Buffer related" section
map <leader>bd :Bclose<cr>

" * Tab configuration
map <leader>tn :tabnew
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
try
  set switchbuf=useopen
  set stal=1
catch
endtry

" * Switch to current dir
map <silent> <leader>cd :cd %:p:h<cr>

" - Parenthesis/bracket expanding
vnoremap @1 <esc>`>a)<esc>`<i(<esc>
"")
vnoremap @2 <esc>`>a]<esc>`<i[<esc>
vnoremap @3 <esc>`>a}<esc>`<i{<esc>
vnoremap @$ <esc>`>a"<esc>`<i"<esc>
vnoremap @q <esc>`>a'<esc>`<i'<esc>
vnoremap @w <esc>`>a"<esc>`<i"<esc>

" - Map auto complete of (, ", ', [
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


" - Editing mappings etc.

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

" - Command-line config
" * Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>
cnoremap <C-F>    <Right>
cnoremap <C-B>    <Left>

" - Buffer realted
" * Open a dummy buffer for paste
map <leader>es :tabnew<cr>:setl buftype=nofile<cr>
if MySys() == "linux"
map <leader>ec :tabnew /tmp/scratch.txt<cr>
else
map <leader>ec :tabnew $TEMP/scratch.txt<cr>
endif

" * Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" * Don't close window, when deleting a buffer
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

" - Filetype generic

" - MISC
" * Quickfix
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :botright cw<cr>
nmap <leader>cc :ccl<cr>
"nmap <leader>cc :botright lw 10<cr>
"map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>

" * auto bottom right the location list window
autocmd FileType qf wincmd J

function! s:GetVisualSelection()
    let save_a = @a
    silent normal! gv"ay
    let v = @a
    let @a = save_a
    let var = escape(v, '\\/.$*')
    return var
endfunction

" * Fast grep
nmap <silent> <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
vmap <silent> <leader>lv :lv /<c-r>=<sid>GetVisualSelection()<cr>/ %<cr>:lw<cr>

" * Fast diff
"cmap @vd vertical diffsplit 
"set diffopt+=vertical

" * Remove the Windows ^M
noremap <Leader>dm mzHmx:%s/<C-V><cr>//ge<cr>'xzt'z:delm x z<cr>

" -Mark as loaded
let g:vimrc_loaded = 1
