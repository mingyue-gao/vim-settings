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

" * Syntax on
syntax on

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
set shiftwidth=2

" * replace tab to spaces
set expandtab

" * in front of a line inserts blanks accordinng to 'shiftwidth'
set smarttab

" - Indent options
" * Auto indent
set autoindent

" * Smart indent
set smartindent

" * Wrap lines
set wrap

" - Favorite filetypes
set ffs=unix,dos

" - set makeprg
set makeprg=make\ -j

" - File type options
" * VIM
autocmd FileType vim set nofen

" * C/C++
autocmd FileType c,cc,cpp,xml,txt map <buffer> <leader><space> :make<cr>

" - How VIM looks
" * Turn on WiLd menu for :find
set wildmenu

" * Enable mouse in console
"set mouse=a

" * Show line number
set nu

" * The commandbar is 2 high
set cmdheight=2

" * Always show the statusline
set laststatus=2

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
Plugin 'VundleVim/Vundle.vim'

Plugin 'ervandew/supertab'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'SirVer/ultisnips'

" vim-airline: a fancy statu bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'vim-scripts/a.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-scripts/DoxygenToolkit.vim'

Plugin 'altercation/vim-colors-solarized'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'


" All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()


"Enable filetype plugin
filetype plugin on
filetype indent on
"filetype plugin indent on    " required by Vundle

"""""""""""""""""""""""""""""""""""""""""
" Codefmt setting
"""""""""""""""""""""""""""""""""""""""""
" Glaive codefmt plugin[mappings] clang_format_style='Google'
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings] clang_format_style='file'
" augroup autoformat_settings
"   " autocmd FileType c,cpp,proto,javascript clang-format
"   " autocmd FileType python autopep8
"   " autocmd FileType html,css,sass,scss,less,json js-beautify
" augroup END


"""""""""""""""""""""""""""""""""""""""""
" You Complete Me setting
"""""""""""""""""""""""""""""""""""""""""
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:ycm_open_loclist_on_ycm_diags = 1
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>ff :YcmCompleter FixIt<CR>

"""""""""""""""""""""""""""""""""""""""""
" UltiSnips setting
"""""""""""""""""""""""""""""""""""""""""
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/mydata/UltiSnips']

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
" DoxygenToolkit
""""""""""""""""""""""""""""""
"let g:DoxygenToolkit_commentType = "C++"
" author info
let g:DoxygenToolkit_authorName = 'Mingyue Gao'
"nmap <leader>dg :Dox<cr>
"nmap <leader>dga :DoxAuthor<cr>
"" license announcement
"nmap <leader>dgl :DoxLic<cr>
autocmd FileType c,cc,cpp map <buffer> <leader>dg :Dox<cr>
autocmd FileType c,cc,cpp map <buffer> <leader>dga :DoxAuthor<cr>
autocmd FileType c,cc,cpp map <buffer> <leader>dgl :DoxLic<cr>

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

"* Fast remove highlight search
nmap <silent> <leader><cr> :noh<cr>

autocmd BufEnter * :syntax sync fromstart

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

" * Switch to current dir
map <silent> <leader>cd :cd %:p:h<cr>

" - Editing mappings etc.
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  nohl
  exe "normal `z"
endfunc

" do not automaticlly remove trailing whitespace
nmap <silent> <leader>ws :call DeleteTrailingWS()<cr>:w<cr>

" * Remove the Windows ^M
noremap <Leader>dm mzHmx:%s/<C-V><cr>//ge<cr>'xzt'z:delm x z<cr>

" * Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" - MISC
" * Quickfix
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :botright cw<cr>
nmap <leader>cc :ccl<cr>

" -Mark as loaded
let g:vimrc_loaded = 1
