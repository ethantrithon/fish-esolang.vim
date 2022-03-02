augroup fsh
	au!
	au BufRead,BufNewFile *.{fsh,><>} set filetype=fish-esolang

	au BufRead,BufnewFile,BufEnter *.{fsh,><>} set virtualedit+=all
	au BufLeave *.{fsh,><>} set virtualedit-=all
	au BufRead,BufnewFile *.{fsh,><>} nnoremap <buffer> i R
	au BufRead,BufnewFile *.{fsh,><>} nnoremap <buffer> > R>
	au BufRead,BufnewFile *.{fsh,><>} nnoremap <buffer> < <Cmd>call fsh#WriteLeftOn()<CR><
	au BufRead,BufnewFile *.{fsh,><>} nnoremap <buffer> ^ <Cmd>call fsh#WriteUpOn()<CR>^
	au BufRead,BufnewFile *.{fsh,><>} nnoremap <buffer> v <Cmd>call fsh#WriteDownOn()<CR>v
augroup END

function fsh#WriteDownOn()
	inoremap <Del> <Up><Del>
	augroup Vert
		au!
		au InsertCharPre * call feedkeys("\<left>\<down>", 'n')
		au InsertLeave * norm kl
		au InsertLeave * call fsh#WriteDirOff()
	augroup END

	startreplace
endfunction


function fsh#WriteUpOn()
	inoremap <Del> <Down><Del>
	augroup Vert
		au!
		au InsertCharPre * call feedkeys("\<left>\<up>", 'n')
		au InsertLeave * norm jl
		au InsertLeave * call fsh#WriteDirOff()
	augroup END

	startreplace
endfunction

function fsh#WriteLeftOn()
	inoremap <Del> <Right><Space><Right>
	augroup Vert
		au!
		au InsertCharPre * call feedkeys("\<left>\<left>", 'n')
		au InsertLeave * norm ll
		au InsertLeave * call fsh#WriteDirOff()
	augroup END

	startreplace
endfunction

function fsh#WriteDirOff()
	iunmap <Del>
	augroup Vert
		autocmd!
	augroup END
endfunction

command! WriteDown call fsh#WriteDownOn()
command! WriteUp call fsh#WriteUpOn()
command! WriteLeft call fsh#WriteLeftOn()
