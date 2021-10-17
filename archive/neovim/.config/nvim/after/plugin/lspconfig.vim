if !exists('g:lspconfig') | finish | endif

lua << EOF
--vim.lsp.set_log_level("debug")
EOF

lua << EOF
-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = {
			spacing = 4,
			prefix = ''
		}
	}
)
EOF

augroup lspconfig
	autocmd!
	autocmd BufWrite,BufEnter,InsertLeave * :lua vim.lsp.diagnostic.set_loclist({open=false})
augroup END
