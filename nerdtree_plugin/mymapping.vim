call NERDTreeAddKeyMap({
      \ 'key': 'l',
      \ 'callback': 'NERDTreeOpenCurrentNode',
      \ 'quickhelpText': 'open current node',
      \ 'scope': 'Node' })

call NERDTreeAddKeyMap({
      \ 'key': 'h',
      \ 'callback': 'NERDTreeCloseParentNode',
      \ 'quickhelpText': 'close parent of node',
      \ 'scope': 'Node' })

function! NERDTreeOpenCurrentNode(node)
  call nerdtree#ui_glue#invokeKeyMap(g:NERDTreeMapActivateNode)
endfunction

function! NERDTreeCloseParentNode(node)
  call nerdtree#ui_glue#invokeKeyMap("x")
endfunction
