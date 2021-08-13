if IsPlugged('vim-fugitive')
    noremap [git] <nop>
    nmap <leader>g [git]
    noremap <silent> [git]s :<c-u>tab sp<cr>:<c-u>Gstatus<cr>:only<cr>
    noremap <silent> [git]b :<c-u>Gblame<cr>
    noremap <silent> [git]f :<c-u>Gfetch<cr>
    noremap <silent> [git]d :<c-u>Gvdiff<cr>
    noremap <silent> [git]l :<c-u>Glog<cr>
    noremap <silent> [git]c :<c-u>Gcd<cr>
endif
