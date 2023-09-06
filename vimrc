"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This vimrc is based on the vimrc by Amix:
"       http://amix.dk/vim/vimrc.html
"
" Maintainer:  Mingyue Gao
" Last Change: Mon Sept 25 16:04:31 CST 2016
" Homepage:    http://www.mingyue.de
" Version:     0.5
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let $VIMHOME=fnamemodify('~/.vim', ':p:h')
" let $VIMDATA=expand($VIMHOME) . '/mydata'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Predefined global settings
" Could be overwritten by plugins
" * Syntax on
syntax on

" * Set mapleader
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Options
"
" * Get out of VI's compatible mode (required by Vundle)
set nocompatible

set notermguicolors

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indention Options
" 
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

" * Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Options
" 
" * Ignore case when searching
set ignorecase

" * Incremental search that shows partial matches
set incsearch

" * Highlight search things
set hlsearch

" * Automatically switch search to case-sensitive when search query contains an uppercase letter
set smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Rendering Options
" 
" * Showing mode [INSERT] on status line is unnecessary because of lightline.vim
set noshowmode

" * Wrap lines
set wrap

" * Set backspace
set backspace=eol,start,indent

" * set whichwrap+=<,>,h,l
set whichwrap+=<,>

" * encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface Options
" 
" * Show line number
set number

" * The commandbar is 2 high
set cmdheight=2

" * Always show the statusline
set laststatus=2

" * Display command line’s tab complete options as a menu.
set wildmenu

" * Highlight the line currently under cursor
set cursorline

" * Enable mouse in console
"set mouse=a

" Open new tabs for navigation/quickfix
set switchbuf=usetab

" taked away
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous Options
" * Enable spellchecking
" set spell

" * Set to auto read when a file is changed from the outside
set autoread

" * Sets how many lines of history VIM has to remember
set history=256

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

" - Favorite filetypes
set ffs=unix,dos

" - set makeprg
set makeprg=make\ -j

" - File type options
" * VIM
autocmd FileType vim set nofen

" * C/C++
autocmd FileType c,cc,cpp,cmake,h,hh,hpp map <buffer> <leader><space> :AsyncRun ninja<cr>

call plug#begin()

Plug 'skywind3000/asyncrun.vim'

" Static code analysis
" Plug 'dense-analysis/ale'

" Plug 'ycm-core/YouCompleteMe'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Shougo/echodoc.vim'

" git signs, e.g. added, modified, etc.
Plug 'mhinz/vim-signify'

Plug 'SirVer/ultisnips'

" status bar
" Plug 'itchyny/lightline.vim'
" Plug 'liuchengxu/eleline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-scripts/a.vim'

Plug 'scrooloose/nerdtree'

Plug 'vim-scripts/DoxygenToolkit.vim'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

call plug#end()
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()

"Enable filetype plugin, required by Vundle
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""
" AsyncRun
<<<<<<< HEAD
=======
"""""""""""""""""""""""""""""""""""""""""
let g:asyncrun_open = 6

"""""""""""""""""""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""""""""""""""""""
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

"""""""""""""""""""""""""""""""""""""""""
" Lightline
>>>>>>> 42f9147c900c71daa9b9ed36257225718bb40c71
"""""""""""""""""""""""""""""""""""""""""
let g:asyncrun_open = 6

" """""""""""""""""""""""""""""""""""""""""
" " ALE
" """""""""""""""""""""""""""""""""""""""""
" let g:ale_linters_explicit = 1
" let g:ale_completion_delay = 500
" let g:ale_echo_delay = 20
" let g:ale_lint_delay = 500
" let g:ale_echo_msg_format = '[%linter%] %code: %%s'
" let g:ale_lint_on_text_changed = 'normal'
" let g:ale_lint_on_insert_leave = 1
" 
" let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
" let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++20'
" let g:ale_c_cppcheck_options = ''
" let g:ale_cpp_cppcheck_options = ''
" 
" let g:ale_sign_error = "\ue009\ue009"
" hi! clear SpellBad
" hi! clear SpellCap
" hi! clear SpellRare
" hi! SpellBad gui=undercurl guisp=red
" hi! SpellCap gui=undercurl guisp=blue
" hi! SpellRare gui=undercurl guisp=magenta

"""""""""""""""""""""""""""""""""""""""""
" Codefmt setting
"""""""""""""""""""""""""""""""""""""""""
" Glaive codefmt plugin[mappings] clang_format_style='Google'
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt clang_format_style=`'file:' . $VIMDATA .'/_clang-format'`
" augroup autoformat_settings
"   " autocmd FileType c,cpp,proto,javascript clang-format
"   " autocmd FileType python autopep8
"   " autocmd FileType html,css,sass,scss,less,json js-beautify
" augroup END


"""""""""""""""""""""""""""""""""""""""""
" You Complete Me setting
"""""""""""""""""""""""""""""""""""""""""
<<<<<<< HEAD
" " make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:ycm_goto_buffer_command = 'new-tab'
" " let g:ycm_open_loclist_on_ycm_diags = 1
" nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>gg :YcmCompleter GoTo<CR>
" nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
" nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
" nnoremap <leader>ff :YcmCompleter FixIt<CR>

"""""""""""""""""""""""""""""""""""""""""
" coc.vim
"""""""""""""""""""""""""""""""""""""""""
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostcs appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() <CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> <leader>gg <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

"""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='simple'
" let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1
=======
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_goto_buffer_command = 'new-tab'
" let g:ycm_open_loclist_on_ycm_diags = 1
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>ff :YcmCompleter FixIt<CR>
>>>>>>> 42f9147c900c71daa9b9ed36257225718bb40c71

"""""""""""""""""""""""""""""""""""""""""
" UltiSnips setting
"""""""""""""""""""""""""""""""""""""""""
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-u>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
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
let g:solarized_termtrans=1 " work with MobaXterm
set background=dark
colorscheme solarized
" colorscheme Monokai
" colorscheme afterglow

"  Settings for compMobaXterm
hi! clear Pmenu
hi! Pmenu term=bold,reverse cterm=bold ctermfg=5 ctermbg=0 guibg=Magenta
hi! clear StatusLine
hi! StatusLine term=bold,reverse cterm=bold ctermfg=6 ctermbg=0 gui=bold,reverse
hi! clear PmenuThumb     
hi! PmenuThumb term=bold,reverse cterm=bold ctermfg=4 ctermbg=0 guibg=White
"  DONE - Settings for compMobaXterm

" Setting for E-ink screen
" Use following for dark theme with normal LED screens
" set background=light
" colorscheme eink

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
