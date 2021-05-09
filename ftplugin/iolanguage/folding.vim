setlocal foldmethod=expr
setlocal foldexpr=GetIolangFold(v:lnum)

function! GetIolangFold(bufline)
  if s:IsOpenBlock(a:bufline)
    return '>' . s:FoldLevel(a:bufline)
  elseif s:IsCloseBlock(a:bufline)
    return '<' . (s:FoldLevel(a:bufline) + 1)
  else
    return '='
  endif
endfunction

function! s:FoldLevel(bufline)
  let lnum = s:LineNumber(a:bufline)
  let cstr = getline(a:bufline)
  let level = count(cstr, "(") - count(cstr, ")")
  if lnum == 0
    return level
  else
    return level + s:FoldLevel(lnum - 1) 
endfunction

function! s:IsOpenBlock(bufline)
  let cstr = getline(a:bufline)
  let open_i = stridx(cstr, "(")
  let close_i = stridx(cstr, ")")

  return open_i > -1 && open_i > close_i
endfunction

function! s:IsCloseBlock(bufline)
  let cstr = getline(a:bufline)
  let open_i = stridx(cstr, "(")
  let close_i = stridx(cstr, ")")

  return close_i > -1 && (open_i < 0 || close_i < open_i)
endfunction

function! s:LineNumber(bufline)
  return max([a:bufline, line(a:bufline)])
endfunction
