if dein#is_sourced('fzf.vim')
    let g:fzf_command_prefix = 'Fzf'
    let g:fzf_layout = {'down': '~39%'}
    let g:fzf_preview_window = []

    if has('win32') || has('win64')
        command! -bang -nargs=* FzfRg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --smart-case "'.<q-args>.'"', 1,
        \   <bang>0)
    endif

    noremap [fzf] <nop>
    nmap <leader>f [fzf]
    noremap <silent> [fzf]f :<c-u>FzfFiles<cr>
    noremap <silent> [fzf]b :<c-u>FzfBuffers<cr>
    noremap <silent> [fzf]h :<c-u>FzfHistory<cr>
    noremap <silent> [fzf]w :<c-u>FzfRg <c-r><c-w><cr>
    noremap <silent> [fzf]c :<c-u>FzfCommits<cr>
    noremap [fzf]r :<c-u>FzfRg 
endif
