function! s:NextSection(type, backwards, isVisual)
  if a:isVisual
    normal! gv
  endif

  if a:type == 1
    let pattern = '\v\((.*(\)|"))@!'
  elseif a:type == 2
    let pattern = '\v((\(.*)|(".*))@<!\zs\)'
  endif

  if a:backwards
    let dir = '?'
  else
    let dir = '/'
  endif

  execute 'silent normal! ' . dir . pattern . dir . "\r"
endfunction

noremap <script> <buffer> <silent> ]]
      \ :call <SID>NextSection(2, 0, 0)<cr>
noremap <script> <buffer> <silent> [[
      \ :call <SID>NextSection(2, 1, 0)<cr>
noremap <script> <buffer> <silent> ][
      \ :call <SID>NextSection(1, 0, 0)<cr>
noremap <script> <buffer> <silent> []
      \ :call <SID>NextSection(1, 1, 0)<cr>

vnoremap <script> <buffer> <silent> ]]
      \ :call <SID>NextSection(2, 0, 1)<cr>
vnoremap <script> <buffer> <silent> [[
      \ :call <SID>NextSection(2, 1, 1)<cr>
vnoremap <script> <buffer> <silent> ][
      \ :call <SID>NextSection(1, 0, 1)<cr>
vnoremap <script> <buffer> <silent> []
      \ :call <SID>NextSection(1, 1, 1)<cr>
