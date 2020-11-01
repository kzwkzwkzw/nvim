if dein#is_sourced('vim-fugitive')
    noremap [fugitive] <nop>
    nmap <leader>g [fugitive]
    noremap <silent> [fugitive]s :<c-u>tab sp<cr>:<c-u>Gstatus<cr>:only<cr>
    noremap <silent> [fugitive]b :<c-u>Gblame<cr>
    noremap <silent> [fugitive]f :<c-u>Gfetch<cr>
    noremap <silent> [fugitive]d :<c-u>Gvdiff<cr>
    noremap <silent> [fugitive]c :<c-u>Gcd<cr>
endif
