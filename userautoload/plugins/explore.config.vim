noremap [explore] <nop>
nmap <leader>e [explore]

if IsPlugged('defx.nvim')
	" key bindings for defx
	autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
		noremap <silent><buffer><expr> <CR>
		\ defx#is_directory() ?
		\ defx#do_action('multi', ['drop', 'change_vim_cwd']) :
		\ defx#do_action('drop')
		noremap <silent><buffer><expr> l
		\ defx#is_directory() ?
		\ defx#do_action('open_tree') :
		\ 'l'
		noremap <silent><buffer><expr> h
		\ defx#do_action('close_tree')
		noremap <silent><buffer><expr> o
		\ defx#is_directory() ?
		\ defx#do_action('open_tree', 'recursive:10') :
		\ defx#do_action('drop')
		noremap <silent><buffer><expr> ..
		\ defx#do_action('cd', ['..'])
		noremap <silent><buffer><expr> -
		\ defx#do_action('cd', ['-'])
		noremap <silent><buffer><expr> j
		\ line('.') == line('$') ? 'gg' : 'j'
		noremap <silent><buffer><expr> k
		\ line('.') == 1 ? 'G' : 'k'

		noremap <silent><buffer><expr> c
		\ defx#do_action('copy')
		noremap <silent><buffer><expr> m
		\ defx#do_action('move')
		noremap <silent><buffer><expr> p
		\ defx#do_action('paste')
		noremap <silent><buffer><expr> d
		\ defx#do_action('remove')
		noremap <silent><buffer><expr> r
		\ defx#do_action('rename')
		noremap <silent><buffer><expr> <c-n>d
		\ defx#do_action('new_directory')
		noremap <silent><buffer><expr> <c-n>f
		\ defx#do_action('new_file')
		noremap <silent><buffer><expr> !
		\ defx#do_action('execute_command')
		noremap <silent><buffer><expr> x
		\ defx#do_action('execute_system')
		noremap <silent><buffer><expr> .
		\ defx#do_action('toggle_ignored_files')

		noremap <silent><buffer><expr> t
		\ defx#do_action('open','tabnew')
		noremap <silent><buffer><expr> yy
		\ defx#do_action('yank_path')
		noremap <silent><buffer><expr> ;
		\ defx#do_action('repeat')
		noremap <silent><buffer><expr> ~
		\ defx#do_action('cd')
		noremap <silent><buffer><expr> <c-g>
		\ defx#do_action('print')
		noremap <silent><buffer><expr> cd
		\ defx#do_action('change_vim_cwd')

		noremap <silent><buffer><expr> q
		\ defx#do_action('quit')
	endfunction

	if IsPlugged('defx.nvim')
		call defx#custom#column('git', 'indicators', {
			\ 'Modified'  : ' ',
			\ 'Renamed'   : ' ',
			\ 'Deleted'   : ' ',
			\ 'Ignored'   : ' ',
			\ 'Staged'    : ' ',
			\ 'Untracked' : ' ',
			\ 'Unmerged'  : ' ',
			\ 'Unknown'   : ' '
			\ })
	endif

	call defx#custom#option('_', {
			\ 'winwidth': 77,
			\ 'split': 'vertical',
			\ 'direction': 'topleft',
			\ 'show_ignored_files': 1,
			\ 'buffer_name': 'exlorer',
			\ 'toggle': 1,
			\ 'resume': 1,
			\ 'columns': 'icons:indent:git:mark:filename:type:size:time',
			\ })

	let g:defx_icons_colum_length = 2

	noremap <silent> [explore] :<c-u>Defx<cr>

	autocmd VimEnter * execute 'Defx'
	autocmd BufWritePost * call defx#redraw()
	autocmd BufEnter * call defx#redraw()
endif

