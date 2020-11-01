if dein#is_sourced('nvim-lspconfig')
    lua require'nvim_lsp'.clangd.setup{}

    noremap [nvim_lsp] <nop>
    nmap <leader>l [nvim_lsp]
    noremap <silent> [nvim_lsp]d <cmd>lua vim.lsp.buf.declaration()<CR>
    noremap <silent> [nvim_lsp]j <cmd>lua vim.lsp.buf.definition()<CR>
    noremap <silent> [nvim_lsp]k <cmd>lua vim.lsp.buf.hover()<CR>
    noremap <silent> [nvim_lsp]h <cmd>lua vim.lsp.buf.signature_help()<CR>
endif
