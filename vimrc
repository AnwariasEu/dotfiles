" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" Enable line numbers
set nu
colorscheme delek
syntax on
" Use spaces instead of tabs
" set expandtab
" One tab == 4 spaces
set tabstop=2
set shiftwidth=2
"highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
"match ExtraWhitespace /\s\+$\| \t\| \^\t*\zs \+/

" Disable mouse interaction
set mouse=c

map  <F8> "+ygg<CR>
map  <F2> :set invnumber<CR>
map  <F3> ~
map! <F3> <ESC>~hi
map  <F4> \ci
map  <F6> :set invlist<CR>
nnoremap <F9> :IndentGuidesToggle<CR>

" Run current python script
nnoremap <buffer> <F9> :w<cr>:! ./%<cr>

" Make Latex 
nnoremap <buffer> <F8> :w<cr>:exec '!pdflatex' shellescape(@%, 1)<cr>

set laststatus=2

if !exists(":W")
    command W w !sudo tee % >/dev/null
endif

" Always show 10 lines above and underneath current line
set scrolloff=10

" Shows changes made since last write
if !exists(":DiffOrig")
      command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
              \ | wincmd p | diffthis
endif

" Traverse line breaks with arrow keys
set whichwrap=b,s,<,>,[,]

" Fix Powerline
let g:powerline_pycmd = 'py3'

" Shows fancy chars when using vim
scriptencoding utf-8
set encoding=utf-8
set listchars=tab:↹\ ,eol:↵,trail:•
filetype plugin on

" Disable Arrow keys and make them usefule
" Destroy arrow keys in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Make arrow keys useful
" Move line up/down
noremap <Up> ddkP
noremap <Down> ddp
" Indent line(s)
noremap <Left> <<
noremap <Right> >>
" Keep visual after action
vmap <Left> <gv
vmap <Right> >gv

" Mark 80th Character of any File red
set colorcolumn=80

" Enable vim undo file
set undofile
" Undofile directorypath
set undodir=$HOME/.vimundo/
