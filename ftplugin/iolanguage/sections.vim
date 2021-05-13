function! s:NextDeclaration(backwards, isVisual)
  if a:isVisual
    normal! gv
  endif

  "  go to the `=` or `:=` or `::=`
  let pattern ='\v^\w+\s+\w*\s*\:{0,2}\='

  if a:backwards
    let dir = '?'
  else
    let dir = '/'
  endif

  execute 'silent normal! ' . dir . pattern . dir . "\r"
endfunction

noremap <script> <buffer> <silent> ]]
      \ :call <SID>NextDeclaration(0, 0)<cr>
noremap <script> <buffer> <silent> [[
      \ :call <SID>NextDeclaration(1, 0)<cr>

vnoremap <script> <buffer> <silent> ]]
      \ :call <SID>NextDeclaration(0, 1)<cr>
vnoremap <script> <buffer> <silent> [[
      \ :call <SID>NextDeclaration(1, 1)<cr>
