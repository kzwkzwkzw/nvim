if IsPlugged('defx.nvim')
    " key bindings for defx
    autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
        noremap <silent><buffer><expr> <CR>
        \ defx#is_directory() ?
        \ defx#do_action('multi', ['drop', 'change_vim_cwd']) :
        \ defx#do_action('multi', ['drop', 'quit'])
        noremap <silent><buffer><expr> l
        \ defx#is_directory() ?
        \ defx#do_action('open_tree') :
        \ 'l'
        noremap <silent><buffer><expr> ..
        \ defx#do_action('cd', ['..'])
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
        noremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
        noremap <silent><buffer><expr> N
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
        noremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
        noremap <silent><buffer><expr> cd
        \ defx#do_action('change_vim_cwd')

        noremap <silent><buffer><expr> q
        \ defx#do_action('quit')
    endfunction

    " window settings
    call defx#custom#option('_', {
        \ 'split': 'floating',
        \ 'show_ignored_files': 1,
        \ 'buffer_name': 'exlorer',
        \ 'toggle': 1,
        \ 'resume': 1,
        \ })

    " key bindings to active defx
    noremap [xplore] <nop>
    nmap <leader>e [explore]
    noremap <silent> [explore] :<c-u>Defx<cr>
endif
