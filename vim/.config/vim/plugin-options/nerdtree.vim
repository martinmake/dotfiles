" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:netrw_localrmdir='rm -r'

let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=25
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeMinimalUI=0
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeMouseMode=1
let g:NERDTreeIgnore=[
	\ '\.pyc',
	\ '\~$',
	\ '\.swo$',
	\ '\.swp$',
	\ '__pycache__',
	\ '\.git',
	\ '\.hg',
	\ '\.svn',
	\ '\.bzr']

" let g:NERDTreeDirArrowExpandable = '📁'
" let g:NERDTreeDirArrowCollapsible = '📂'

function! NerdTreeToggle()
  if &ft == 'nerdtree' && winnr('$') == 1
    return
  endif
  execute 'NERDTreeToggle '.expand('%:p:h')
endfunction

nmap <silent> <Plug>NerdTreeStart :call NerdTreeToggle()<cr>
