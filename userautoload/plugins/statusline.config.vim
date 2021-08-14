if IsPlugged('lightline.vim')
    let g:lightline = {
        \ 'colorscheme': 'PaperColor',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['cocstatus', 'gitbranch', 'readonly', 'filename', 'modified'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileencoding'],
        \   ]
        \ },
        \ 'component_function': {
        \   'mode': 'MyMode',
        \   'cocstatus': 'coc#status',
        \   'gitbranch': 'MyFugitive',
        \   'charcode': 'MyCharCode',
        \   'fileencoding': 'MyFileencoding',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \ },
        \ 'separator': {'left': '', 'right': ' '},
        \ 'subseparator': {'left': '', 'right': ' '}
        \ }

    function! MyMode()
        return winwidth('.') > 70 ? '  '.lightline#mode() : ''
    endfunction

    function! MyFugitive()
		if exists("*fugitive#head")
			let _ = fugitive#head()
			return strlen(_) ? ' '._ : ''
		endif
		return ''
        return winwidth('.') > 70 ? ' '.lightline#mode() : ''
    endfunction

    function! MyFileencoding()
		if &fileformat == 'dos'
			let _ff = ' '
		elseif &fileformat == 'unix'
			let _ff = ' '
		elseif &fileformat == 'mac'
			let _ff = ' '
		else
			let _ff = &fileformat
		endif
        return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc.' '._ff : &enc.' '._ff) : ''
    endfunction

    " https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
    function! MyCharCode()
        if winwidth('.') <= 70
            return ''
        endif
        " Get the output of :ascii
        redir => ascii
        silent! ascii
        redir END
        if match(ascii, 'NUL') != -1
          return 'NUL'
        endif
        " Zero pad hex values
        let nrformat = '0x%02x'
        let encoding = (&fenc == '' ? &enc : &fenc)
        if encoding == 'utf-8'
          " Zero pad with 4 zeroes in unicode files
          let nrformat = '0x%04x'
        endif
        " Get the character and the numeric value from the return value of :ascii
        " This matches the two first pieces of the return value, e.g.
        " "<F>  70" => char: 'F', nr: '70'
        let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')
        " Format the numeric value
        let nr = printf(nrformat, nr)
        return "'". char ."' ". nr
    endfunction
endif

