"set shell=zsh\ -l

" Vundle...
" =========

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
"Plugin 'editorconfig/editorconfig-vim'
Plugin 'sgur/vim-editorconfig'
Plugin 'scrooloose/nerdcommenter'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'reedes/vim-wordy'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'nginx.vim'
"Plugin 'airblade/vim-gitgutter'

Plugin 'w0rp/ale'

" <Leader>ig
Plugin 'nathanaelkane/vim-indent-guides'

if !has('nvim')
  Plugin 'tpope/vim-sensible'
  Plugin 'ConradIrwin/vim-bracketed-paste'
endif

call vundle#end()
filetype plugin indent on

" ...end Vundle

syntax enable

" Remap leader key.
let mapleader = ","

set noswapfile

if (has('termguicolors'))
  set termguicolors
endif

if has('gui_running')
  set background=light
else
  set background=dark
endif

" Gruvbox colorscheme
let g:gruvbox_bold = 0
let g:gruvbox_underline = 0
colorscheme gruvbox

" Use TextMate-style invisibles.
set listchars=tab:▸\ ,eol:¬,trail:·

" Show line numbers.
set number

" <Leader>n — Toggle relative line numbering.
nnoremap <Leader>n :set relativenumber!<CR>

" Show invisibles.
set list

" Highlight current line.
set cursorline

" Highlight some common column widths.
if exists('+colorcolumn')
  set colorcolumn=81,121
endif

" Keep three lines visible above and below.
set scrolloff=3

" Use two spaces for tabs.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Disable arrow keys.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Claim custom filetypes.
augroup vimrc_custom_filetypes
  autocmd!
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.mjml set filetype=xml
augroup END

" Diagraph mappings.
if has("digraphs")
  silent! dig ;; 8230  " HORIZONTAL ELLIPSIS
  silent! dig -n 8211  " EN DASH (vim default is -N)
  silent! dig -m 8212  " EM DASH (vim default is -M)
endif

" Slightly quicker brackets
inoremap (( ()<Left>
inoremap [[ []<Left>
inoremap {{ {}<Left>
inoremap %% {%  %}<Left><Left><Left>

" Twiddle case. Hit ~ to cycle lower, capital, and titlecase.
" - http://vim.wikia.com/wiki/Switching_case_of_characters
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" Cursor Tweaks
" =============

" Use a thin cursor shape when in insert mode.
" - https://gist.github.com/andyfowler/1195581
if !has('nvim')
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif

" Leader commands
" ===============

" a — Select all.
nnoremap <Leader>a ggVG

" hs — Toggle search highlighting.
nnoremap <Leader>hs :set hlsearch! hlsearch?<CR>

" c/ — Show a count of search results
nnoremap <Leader>c/ :%s/<C-r>// /gn<CR>

" e — Find the visual selection using vimgrep: http://qr.ae/TSdv6
vnoremap <Leader>e "hy:vimgrep "<C-r>h" **/*.* \| copen

" b — Match bracket (easier to reach than %)
map <Leader>b %

" w — Faster save
nmap <leader>w :w!<CR>

" wm — Toggle writing mode.
nmap <leader>wm :set list!<CR>:set number!<CR>

" Use alt key for inc/deincrement numbers because C-a conflict with my Tmux setup.
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" Copy and paste
" ==============
if !has('nvim')
  " Copy the current text selection to the system clipboard
  " Note: this doesn’t work at the moment.
  if has('gui_running')
    noremap <Leader>y "+y
  else
    " Copy to attached terminal using the yank script:
    " - https://github.com/sunaku/home/blob/master/bin/yank
    noremap <Leader>y y:call system('~/.vim/osc52-yank.sh', @0)<CR>
  endif
endif

" Searching
" =========
set ignorecase
set smartcase

" Centre screen when jumping between search matches.
nmap n nzz
nmap N Nzz

" Tab goes to next search match without centring the screen.
nnoremap <Tab> n

" <Leader>hs — Toggle search highlighting.
nnoremap <Leader>hs :set hlsearch!<CR>

" <Leader>e - Find the visual selection using vimgrep.
" - http://qr.ae/TSdv6
vnoremap <Leader>e "hy:vimgrep "<C-r>h" **/*.* \| copen

" Visual select most recently edited text.
nnoremap gV `[v`]

" Navigate buffers
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>
nnoremap b# :b#<CR>

" Search into subfolders
set path+=**

" Configure OmniCompletion.
filetype plugin on
set completeopt=menu,menuone,preview,longest
set omnifunc=syntaxcomplete#Complete
augroup vimrc_omnifunc
  autocmd!
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
augroup END

" Smash keys to exit insert mode.
inoremap jk <Esc>
inoremap kj <Esc>

" Airline.
" - https://github.com/bling/vim-airline
if exists(':AirlineTheme')
  let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'VL',
      \ '' : 'VB',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.whitespace = 'Ξ'
  "let g:airline#extensions#whitespace#enabled = 1
  "let g:airline#extensions#syntastic#enabled = 1

  call airline#parts#define_accent('mode', 'none')
  let g:airline_section_z = '%3P'
endif

" Wordy.
nnoremap <silent> K :NextWordy<CR>

" ALE
let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint', 'flow']
let g:ale_linters['text'] = ['proselint']
let g:ale_linters['php'] = ['php']

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']

if exists(':AirlineTheme')
  let g:airline#extensions#ale#enabled = 1
endif

" Move text blocks.
" - https://dockyard.com/blog/2013/09/26/vim-moving-lines-aint-hard

" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
" Disabled for now as I'm used to <C-k> for entering digraphs.
"inoremap <C-j> <ESC>:m .+1<CR>==gi
"inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
