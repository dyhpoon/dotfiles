lua require("dyhpoon")

nnoremap <silent> ;b <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

" Dotfile
nnoremap <leader>en :lua require('dyhpoon.telescope').edit_neovim()<CR>

" Files
" nnoremap <C-p> :lua require('telescope.builtin').git_files({ layout_config = { prompt_position = "top" }, sorting_strategy = "ascending" })<CR>
" nnoremap <Leader>ff :lua require('dyhpoon.telescope').find_files()<CR>
nnoremap <Leader>ff :lua require('dyhpoon.telescope').find_files_frecency()<CR>
nnoremap <Leader>fg :lua require('dyhpoon.telescope').live_grep()<CR>
nnoremap <leader>fw :lua require('dyhpoon.telescope').grep_string()<CR>
nnoremap <Leader>fe :lua require('dyhpoon.telescope').file_browser()<CR>
" nnoremap <Leader>pp :lua require('dyhpoon.telescope').project_search()<CR>
nnoremap <Leader>z :lua require('telescope').extensions.zoxide.list{}<CR>

" Git
nnoremap <Leader>gs :lua require('dyhpoon.telescope').git_status()<CR>
nnoremap <Leader>gc :lua require('dyhpoon.telescope').git_commits()<CR>
nnoremap <leader>gb :lua require('dyhpoon.telescope').git_branches()<CR>

" Nvim
nnoremap <Leader>fh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <Leader>gp :lua require('dyhpoon.telescope').grep_prompt()<CR>
