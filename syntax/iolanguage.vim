if exists("b:current_syntax") 
  finish
endif

syntax match ioObject '\v\a+'
syntax match ioType '\v<\u\w+'
syntax match ioMessage '\v\w+\('he=e-1
syntax match ioMessage '\v\)\s+\w+'hs=s+1
syntax match ioMessage '\>\s\+\w\+'

syntax keyword ioKeyword method break continue return true false
syntax keyword ioConditional if else elseif ifTrue ifFalse
syntax keyword ioRepeat for loop repeat while

syntax match ioOperator '\V=\|+\|*\|%\|-\|\/\|>\|<'
syntax match ioOperator '\V=='
syntax match ioOperator '\V!='
syntax match ioOperator '\V>='
syntax match ioOperator '\V<='
syntax match ioOperator '\V:='
syntax match ioOperator '\V::='
syntax match ioOperator '\V..'

syntax region ioString start=/"/ skip=/\\"/ end=/"/
syntax region ioString start=/"""/ end=/"""/

syntax match ioComment '\v#.*$'
syntax match ioComment '\v//.*$'
syntax region ioComment start=/\V\/*/ end=/\V*\//


highlight link ioType Typedef
highlight link ioObject Identifier
highlight link ioMessage Operator

highlight link ioKeyword Keyword
highlight link ioConditional Conditional
highlight link ioRepeat Repeat
highlight link ioOperator Operator
highlight link ioString String
highlight link ioComment Comment

let b:current_syntax = "iolanguage"
