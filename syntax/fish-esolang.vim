if exists("b:current_syntax")
	finish
endif

syn match  FEdirection '[><^vx]'
syn match  FEmirror    '[/\|_#]'
syn match  FEjump      '[!?.]'
syn match  FEdigit     '[0-9a-f]'
syn match  FEbinary    '[+\-*,%()=]'
syn match  FEstring    '['"]'
syn region FEstring    start='"' end='"'
syn match  FEstack     '[:~$@}{rl[\]&]'
syn match  FEio        '[oni]'
syn match  FEreflect   '[gp]'
syn match  FEstop      '[;]'
syn match  FEinvalid   '[^><^vx/\|_#!?.0-9a-f+\-*,%()='":~$@}{rl[\]&onigp;]'

hi def link FEdirection Keyword
hi def link FEmirror    Keyword
hi def link FEjump      Statement
hi def link FEdigit     Number
hi def link FEbinary    Operator
hi def link FEstring    String
hi def link FEstack     Function
hi def link FEio        String
hi def link FEreflect   Special
hi def link FEstop      Question
hi def link FEinvalid   Comment

let b:current_syntax = "><>"
