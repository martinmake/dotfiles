lua require('lspconfig').hls.setup{
\	on_attach=require('custom.lsp.on_attach'),
\	root_dir = require('lspconfig.util').root_pattern('*.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml', '*'),
\}
