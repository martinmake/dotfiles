setlocal commentstring=//\ %s

" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

lua require('lspconfig').clangd.setup{on_attach=require'custom.lsp.on_attach'}
