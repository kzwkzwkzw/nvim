" binary file
augroup binary
    autocmd!
    autocmd BufReadPre  *.bin let &bin=1
    autocmd BufReadPost * if &bin | %!xxd -g 1
    autocmd BufReadPost * set filetype=xxd | endif
    autocmd BufWritePre * if &bin | %!xxd -r
    autocmd BufWritePre * endif
    autocmd BufWritePost * if &bin | %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END

