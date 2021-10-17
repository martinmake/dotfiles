if !exists('g:loaded_nerd_tree')
  call plug#load('nerdtree-git-plugin', 'nerdtree')
  call g:NERDTreeCreator.CreateWindowTree(expand('%:p'))
endif

setlocal colorcolumn=0
