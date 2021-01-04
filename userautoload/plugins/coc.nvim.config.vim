if dein#is_sourced('coc.nvim')
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

    noremap [lsp] <nop>
    nmap <leader>l [lsp]
    nmap <silent> [lsp]d <plug>(coc-definition)
    nmap <silent> [lsp]td <plug>(coc-type-definition)
    nmap <silent> [lsp]i <plug>(coc-implementation)
    nmap <silent> [lsp]rf <plug>(coc-references)
    nmap <silent> [lsp]rn <Plug>(coc-rename)
    nmap <silent> [lsp]f <Plug>(coc-format-selected)
    nmap <silent> [lsp]cs <Plug>(coc-codeaction-selected)
    nmap <silent> [lsp]ca <Plug>(coc-codeaction)
    nmap <silent> [lsp]qf <Plug>(coc-fix-current)
endif
