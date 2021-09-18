if !exists('g:loaded_telescope') | finish | endif

lua require('custom.telescope')

nnoremap <silent> <C-f>       <CMD>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent> <leader>ff  <CMD>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent> <leader>fg  <CMD>lua require('telescope.builtin').git_files()<CR>
nnoremap <silent> <leader>fs  <CMD>lua require('telescope.builtin').grep_string()<CR>
nnoremap <silent> <leader>fh  <CMD>lua require('telescope.builtin').help_tags()<CR>
nnoremap <silent> <leader>fd  <CMD>lua require('custom.telescope').find_dotfiles()<CR>
nnoremap <silent> <leader>gb  <CMD>lua require('custom.telescope').git_branches()<CR>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
-- require('telescope').setup{
--   defaults = {
--     mappings = {
--       n = {
--         ["q"] = actions.close
--       },
--     },
--   }
-- }
EOF
