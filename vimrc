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
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'ConradIrwin/vim-bracketed-paste'

" <leader>ig
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

" Diagraph mappings for some frequently­ used special characters.
" These are similar to the Mac keyboard layout to which I'm accustomed.
" I've since discovered '6 and '9 (and their double-quote cousins) for curly
" quotes. Makes sense. I'll keep these here and review which ones win in time.
if has("digraphs")
    silent! dig '[ 8216  " LEFT SINGLE QUOTATION MARK
    silent! dig '] 8217  " RIGHT SINGLE QUOTATION MARK
    silent! dig \"[ 8220 " LEFT DOUBLE QUOTATION MARK
    silent! dig \"] 8221 " RIGHT DOUBLE QUOTATION MARK
    silent! dig ;; 8230  " HORIZONTAL ELLIPSIS
endif

" Plugin: vim-jsx
" Enable JSX syntax highlighting in .js files.
" - https://github.com/mxw/vim-jsx
let g:jsx_ext_required = 0

" Leader commands
" ===============

" <Leader>a — Select all.
nnoremap <Leader>a ggVG

" Incubating...
" =============

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

" <Leader>e - Find the visual selection using vimgrep.
" - http://qr.ae/TSdv6
vnoremap <Leader>e "hy:vimgrep "<C-r>h" **/*.* \| copen

" Visual select most recently edited text.
nnoremap gV `[v`]

" Configure OmniCompletion.
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
" https://github.com/bling/vim-airline
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

" ... end incubating
