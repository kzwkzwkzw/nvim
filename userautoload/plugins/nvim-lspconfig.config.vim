if dein#is_sourced('nvim-lspconfig')
    lua require'nvim_lsp'.clangd.setup{}

    noremap [nvim_lsp] <nop>
    nmap <leader>l [nvim_lsp]
    noremap <silent> [nvim_lsp]h <cmd>lua vim.lsp.buf.hover()<CR>
    "noremap <silent> [nvim_lsp]i <cmd>lua vim.lsp.buf.implementation()<CR>
    noremap <silent> [nvim_lsp]s <cmd>lua vim.lsp.buf.signature_help()<CR>
    "noremap <silent> [nvim_lsp]t <cmd>lua vim.lsp.buf.type_definition()<CR>
    noremap <silent> [nvim_lsp]r <cmd>lua vim.lsp.buf.references()<CR>
    noremap <silent> [nvim_lsp]ds <cmd>lua vim.lsp.buf.document_symbol()<CR>
    noremap <silent> [nvim_lsp]ws <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

    noremap <silent> [nvim_lsp]j <cmd>lua vim.lsp.buf.definition()<CR>
    "noremap <silent> [nvim_lsp]dc <cmd>lua vim.lsp.buf.declaration()<CR>
endif
