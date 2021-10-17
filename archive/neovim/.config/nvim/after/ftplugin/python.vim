setlocal commentstring=#\ %s

setlocal foldmethod=syntax

setlocal tabstop=4
setlocal shiftwidth=4

lua require('lspconfig').pylsp.setup{on_attach=require'completion'.on_attach}
