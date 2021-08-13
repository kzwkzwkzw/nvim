noremap [git] <nop>
nmap <leader>g [git]

if IsPlugged('vim-fugitive')
    noremap <silent> [git]s :<c-u>tab sp<cr>:<c-u>Gstatus<cr>:only<cr>
    noremap <silent> [git]f :<c-u>Gfetch<cr>
    noremap <silent> [git]d :<c-u>Gvdiff<cr>
    noremap <silent> [git]l :<c-u>Glog<cr>
    noremap <silent> [git]c :<c-u>Gcd<cr>
endif

if IsPlugged('vim-signify')
endif

if IsPlugged('git-blame.nvim')
    let g:gitblame_enabled = 0
    let g:gitblame_highlight_group = "Question"
    noremap <silent> [git]b :<c-u>GitBlameToggle<cr>
endif
