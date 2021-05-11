if !exists("g:io_command")
  let g:io_command = "io"
endif

function! IoRunFile()
  silent !clear
  execute "!" . g:io_command . " " . bufname("%")
endfunction

nnoremap <buffer> <localleader>r :call IoRunFile()<cr>
