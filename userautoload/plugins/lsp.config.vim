noremap [lsp] <nop>
nmap <leader>l [lsp]

if IsPlugged('coc.nvim')
	" Use tab for trigger completion with characters ahead and navigate.
	" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	" other plugin before putting this into your config.
	inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Make <CR> auto-select the first completion item and notify coc.nvim to
	" format on enter, <cr> could be remapped by other vim plugin
	inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
								  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

	" Use `[e` and `]e` to navigate diagnostics
	" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
	nmap <silent> [e <Plug>(coc-diagnostic-prev)
	nmap <silent> ]e <Plug>(coc-diagnostic-next)

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	  if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	  elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	  else
		execute '!' . &keywordprg . " " . expand('<cword>')
	  endif
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')

	function! s:goto_tag(tagkind) abort
		let tagname = expand('<cWORD>')
		let winnr = winnr()
		let pos = getcurpos()
		let pos[0] = bufnr()
		if CocAction('jump' . a:tagkind)
			call settagstack(winnr, {
				\ 'curidx': gettagstack()['curidx'],
				\ 'items': [{'tagname': tagname, 'from': pos}]
				\ }, 't')
		endif
	endfunction

	nmap <silent> [lsp]d :call <sid>goto_tag("Definition")<cr>
	nmap <silent> [lsp]td :call <sid>goto_tag("TypeDefinition")<cr>
	nmap <silent> [lsp]i :call <sid>goto_tag("Implementation")<cr>
	nmap <silent> [lsp]rf :call <sid>goto_tag("References")<cr>
	nmap <silent> [lsp]rn <Plug>(coc-rename)
	nmap <silent> [lsp]f <Plug>(coc-format-selected)
	nmap <silent> [lsp]cs <Plug>(coc-codeaction-selected)
	nmap <silent> [lsp]ca <Plug>(coc-codeaction)
	nmap <silent> [lsp]qf <Plug>(coc-fix-current)

	nmap <silent> [lsp]l :CocCommand clangd.switchSourceHeader<cr>
endif
