" Select all
nmap <C-a> gg<S-v>G

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit
" nmap <C-[> :tabprev<Return>
" nmap <C-]> :tabnext<Return>

"------------------------------
" Windows
"
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-
" Copy paths
nmap cp :let @+ = expand("%")<Return>
nmap cfp :let @+ = expand("%:p")<Return>
nmap cgp :.GBrowse!<Return>
