if dein#is_sourced('denite.nvim')
    " key bindings for denite
    autocmd FileType denite call s:denite_my_settings()
    function! s:denite_my_settings() abort
        nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')

        nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
        nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
        nnoremap <silent><buffer><expr> s
        \ denite#do_map('do_action', 'split')
        nnoremap <silent><buffer><expr> v
        \ denite#do_map('do_action', 'vsplit')

        nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
        nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')

        nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
    endfunction

    " Change file/rec command
    if executable('rg')
        call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
    endif

    " Ripgrep command on grep source
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

    " key bindings to active denite
    noremap [searcher] <nop>
    nmap <leader>d [searcher]
    noremap <silent> [searcher]f :<c-u>Denite file/rec<cr>
    noremap <silent> [searcher]b :<c-u>Denite buffer<cr>
    noremap <silent> [searcher]a :<c-u>Denite -start-filter file/rec buffer<cr>
    noremap <silent> [searcher]g :<c-u>Denite -winheight=`winheight(0)/2` -buffer-name=mygrep grep<cr>
    noremap <silent> [searcher]r :<c-u>Denite -resume -winheight=`winheight(0)/2` -buffer-name=mygrep<cr>
endif
