noremap [search] <nop>
nmap <leader>s [search]

if IsPlugged('denite.nvim')
	autocmd FileType denite call s:denite_my_settings()
	function! s:denite_my_settings() abort
		nnoremap <silent><buffer><expr> i
		\ denite#do_map('open_filter_buffer')
		nnoremap <silent><buffer><expr> p
		\ denite#do_map('do_action', 'preview')
		nnoremap <silent><buffer><expr> <CR>
		\ denite#do_map('do_action')
		nnoremap <silent><buffer><expr> t
		\ denite#do_map('do_action', 'tabopen')
		nnoremap <silent><buffer><expr> s
		\ denite#do_map('do_action', 'split')
		nnoremap <silent><buffer><expr> v
		\ denite#do_map('do_action', 'vsplit')
		nnoremap <silent><buffer><expr> m
		\ denite#do_map('toggle_select').'j'
		nnoremap <silent><buffer><expr> q
		\ denite#do_map('quit')
	endfunction

	call denite#custom#option('default', {
		\ 'split': 'floating',
		\ })

	if executable('rg')
		call denite#custom#var('file/rec', 'command',
		\ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
	endif

	if executable('rg')
		call denite#custom#var('grep', {
		\ 'command': ['rg'],
		\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
		\ 'recursive_opts': [],
		\ 'pattern_opt': ['--regexp'],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })
	endif

	noremap <silent> [search]f :<c-u>Denite file/rec -start-filter<cr>
	noremap <silent> [search]b :<c-u>Denite buffer<cr>
	noremap <silent> [search]c :<c-u>Denite colorscheme<cr>
	noremap <silent> [search]g :<c-u>Denite grep -split=floating -buffer-name=mygrep<cr>
	noremap <silent> [search]r :<c-u>Denite -resume -buffer-name=mygrep<cr>
endif
