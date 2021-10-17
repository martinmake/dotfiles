if !exists('#LspColors') | finish | endif

lua << EOF
require("lsp-colors").setup({
	Error = "#ff0000",
	Warning = "#d0d000",
	Information = "#0000ff",
	Hint = "#ffff00"
})
EOF
