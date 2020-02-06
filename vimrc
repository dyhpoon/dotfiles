" ============================================================================
" .vimrc of Darren Poon
" ============================================================================

" Download vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

silent! if plug#begin('~/.vim/plugged')

" My Plugins
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'haishanh/night-owl.vim'
Plug 'tpope/vim-fugitive'

" Browsing
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

call plug#end()
endif

" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

set number relativenumber " Show line number
set showcmd " Show me what I'm typing
set showmode " show current mode
set encoding=utf-8 " Set default encoding to UTF-8
set noswapfile " Don't use swapfile
set nobackup " Don't create annoying backup files
set autoindent
set incsearch " Shows the match while typing
set hlsearch " Highlight found searches
set ignorecase " Search case insensitive
set scrolloff=5 " Minimal number of screen lines to keep above and below the cursor
set laststatus=2
set termguicolors

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------
nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>

" <C-n> | NERD tree
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

" <C-c> | fzf
nnoremap <C-p> :<C-u>FZF<CR>

" ----------------------------------------------------------------------------
" Fugitive
" ----------------------------------------------------------------------------
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gb :Gblame<CR>

" ----------------------------------------------------------------------------
" goyo.vim + limelight.vim
" ----------------------------------------------------------------------------
let g:limelight_conceal_ctermfg = 240
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  Limelight
  let &l:statusline = '%M'
  hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>G :Goyo<CR>

set ffs=unix
set encoding=utf-8
set fileencoding=utf-8
set listchars=eol:¶
set list
