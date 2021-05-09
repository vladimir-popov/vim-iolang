setlocal foldmethod=expr
setlocal foldexpr=GetIolangFold(v:lnum)

function! GetIolangFold(lnum)
    let cstr = getline(a:lnum)
    if IsOpenBlock(cstr)
        return '>' . IndentLevel(a:lnum)
    elseif IsCloseBlock(cstr)
      return '<' . IndentLevel(a:lnum)
    else
      return -1
    endif
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function IsOpenBlock(cstr)
  let open_i = stridx(a:cstr, "(")
  let close_i = stridx(a:cstr, ")")

  return open_i > -1 && open_i > close_i
endfunction

function IsCloseBlock(cstr)
  let open_i = stridx(a:cstr, "(")
  let close_i = stridx(a:cstr, ")")

  return close_i > -1 && close_i < open_i
endfunction
