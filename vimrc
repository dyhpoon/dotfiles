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
" Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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

set nu " Show line number
set showcmd " Show me what I'm typing
set showmode " show current mode
set encoding=utf-8 " Set default encoding to UTF-8
set noswapfile " Don't use swapfile
set nobackup " Don't create annoying backup files
set autoindent
set incsearch " Shows the match while typing
set hlsearch " Highlight found searches
set scrolloff=5 " Minimal number of screen lines to keep above and below the cursor
set laststatus=2

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------
"

" <C-n> | NERD tree
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
