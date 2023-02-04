" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if its on tiny or small
if !1 | finish | endif

set exrc
highlight iCursor guifg=white guibg=white
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver300-iCursor
set nohlsearch
set hidden
set noerrorbells

set incsearch
set colorcolumn=80
set signcolumn=yes

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
"}}}


lua require("dyhpoon")

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
