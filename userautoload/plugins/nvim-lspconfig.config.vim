if dein#is_sourced('nvim-lspconfig')
    lua require'nvim_lsp'.clangd.setup{}

    noremap [lsp] <nop>
    nmap <leader>l [lsp]
    noremap <silent> [lsp]j <cmd>lua vim.lsp.buf.definition()<CR>
    noremap <silent> [lsp]h <cmd>lua vim.lsp.buf.hover()<CR>
    noremap <silent> [lsp]i <cmd>lua vim.lsp.buf.implementation()<CR>
    noremap <silent> [lsp]s <cmd>lua vim.lsp.buf.signature_help()<CR>
    noremap <silent> [lsp]t <cmd>lua vim.lsp.buf.type_definition()<CR>
    noremap <silent> [lsp]r <cmd>lua vim.lsp.buf.references()<CR>
    noremap <silent> [lsp]ds <cmd>lua vim.lsp.buf.document_symbol()<CR>
    noremap <silent> [lsp]ws <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
    noremap <silent> [lsp]dc <cmd>lua vim.lsp.buf.declaration()<CR>
endif
