" Vundle...
" =========

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'reedes/vim-wordy'
Plugin 'xsbeats/vim-blade'

" <Leader>su
Plugin 'vim-scripts/visSum.vim'

" <Leader>ig
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()
filetype plugin indent on

" ...end Vundle

syntax enable

" Remap leader key.
let mapleader = ","

set t_Co=16

if has('gui_running')
  set background=light
else
  set background=dark
endif

" Use solarized theme.
" - http://ethanschoonover.com/solarized/vim-colors-solarized
colorscheme solarized

" Invisible character colors.
highlight NonText ctermfg=240 guifg=#eee8d5

" Use TextMate-style invisibles.
set listchars=tab:▸\ ,eol:¬,trail:·

" Show line numbers.
set number

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

" Use four spaces for tabs.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Hide MacVim toolbar.
set go-=T

" Set font.
set guifont=Menlo\ Regular:h13

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

" Claim .md files as Markdown
" - https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Diagraph mappings.
if has("digraphs")
  silent! dig ;; 8230  " HORIZONTAL ELLIPSIS
endif

" Leader commands
" ===============

" a — Select all.
nnoremap <Leader>a ggVG

" hs — Toggle search highlighting.
noremap <Leader>hs :set hlsearch! hlsearch?<CR>

" e — Find the visual selection using vimgrep: http://qr.ae/TSdv6
vnoremap <Leader>e "hy:vimgrep "<C-r>h" **/*.* \| copen

" Incubating...
" =============

inoremap (( ()<Left>
inoremap [[ []<Left>
inoremap {{ {}<Left>

" <Tab> is easier to reach than %
map <Tab> %

set noswapfile

" Copy the current text selection to the system clipboard
" Note: this doesn’t work at the moment.
if has('gui_running')
  noremap <Leader>y "+y
else
  " Copy to attached terminal using the yank script:
  " - https://github.com/sunaku/home/blob/master/bin/yank
  noremap <Leader>y y:call system('~/.vim/osc52-yank.sh', @0)<CR>
endif

" Syntastic newbie settings.
" - https://github.com/scrooloose/syntastic#settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic Javascript linter.
let g:syntastic_javascript_checkers = ['eslint']

" Syntastic PHP code sniffer.
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "-n --report=csv"

" Better twiddle case.
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

" OmniCompletion.
filetype plugin on
set completeopt=menu,menuone,preview,longest
set omnifunc=syntaxcomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Use Ctrl-S for save.
" - http://stackoverflow.com/a/3448551
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Smash keys to exit insert mode.
inoremap jk <Esc>
inoremap kj <Esc>

" Airline.
" - https://github.com/bling/vim-airline
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
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" Wordy
nnoremap <silent> K :NextWordy<CR>

" Use a thin cursor shape when in insert mode.
" - https://gist.github.com/andyfowler/1195581
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Enable mouse support.
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
  map <ScrollWheelUp> <C-Y>
  map <ScrollWheelDown> <C-E>
endif

" ... end incubating
