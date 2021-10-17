lua require('lspconfig').cmake.setup{on_attach=require'completion'.on_attach}

setlocal commentstring=#\ %s

autocmd BufEnter * RainbowToggleOff
