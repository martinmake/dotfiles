setlocal commentstring=//\ %s

lua require('lspconfig').clangd.setup{on_attach=require'completion'.on_attach}
