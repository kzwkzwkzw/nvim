"----------------------------------------------
" key map        Normal  Insert  Command Visual
"----------------------------------------------
" map/noremap    @       -       -       @
" nmap/nnoremap  @       -       -       -
" imap/inoremap  -       @       -       -
" cmap/cnoremap  -       -       @       -
" vmap/vnoremap  -       -       -       @
" map!/noremap!  -       @       @       -
"----------------------------------------------

" cursor
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <c-l> $
noremap <c-h> 0
noremap <c-j> %

" window
noremap <c-s>j <c-w>j
noremap <c-s>k <c-w>k
noremap <c-s>l <c-w>l
noremap <c-s>h <c-w>h
noremap <c-s>J <c-w>J
noremap <c-s>K <c-w>K
noremap <c-s>L <c-w>L
noremap <c-s>H <c-w>H
noremap <c-s>r <c-w>r
noremap <c-s>= <c-w>=
noremap <c-s>w <c-w>w
noremap <c-s>o <c-w>o
noremap <c-s>s :<c-u>sp<cr>
noremap <c-s>v :<c-u>vs<cr>
noremap <c-s>q :<c-u>q<cr>
noremap <c-s>Q :<c-u>bd<cr>
noremap <c-s>et :<c-u>tablast <bar> tabnew 
noremap <c-s>t :<c-u>tabnew 
noremap <c-s>f :<c-u>find 
noremap <c-s>c :<c-u>tabclose<cr>
noremap <c-s>n gt
noremap <c-s>p gT
for n in range(1, 9)
    execute 'noremap <silent> <c-s>'.n ':<c-u>tabnext'.n.'<cr>'
endfor

" yank
nnoremap <c-y> yiw
vnoremap <c-y> y

" put
noremap <c-p> viw"0p

" search
vnoremap * y/\V<c-r>=substitute(escape(@@,"/\\"),"\n","\\\\n","ge")<cr><cr>gV
noremap <silent> <esc><esc> :<c-u>nohlsearch<cr>

" substitute
nnoremap gs :<c-u>%s///g<left><left><left><c-r><c-w><right><right>
vnoremap gs :s///g<left><left><left>

" grep
noremap gre :<c-u>gre 
noremap grw :<c-u>gre <c-r><c-w> <bar> cw<cr>
noremap grc :<c-u>gre <c-r><c-w> -tc<left><left><left><left>

" quick fix
noremap <silent> ql :<c-u>cw<cr>
noremap <silent> qn :<c-u>cn<cr>
noremap <silent> qp :<c-u>cp<cr>

" path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" terminal
noremap [terminal] <nop>
nmap <leader>t [terminal]
noremap <silent> [terminal]b :<c-u>terminal bash<cr>
noremap <silent> [terminal]c :<c-u>terminal cmd<cr>
tnoremap <esc><esc> <c-\><c-n>

