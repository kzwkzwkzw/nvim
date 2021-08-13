" setting plugin manager
let s:mng_repo_dir = expand('$XDG_CONFIG_HOME/nvim/plug/repo')
if &runtimepath !~# '/plug.vim'
    if !isdirectory(s:mng_repo_dir)
        execute '!git clone https://github.com/junegunn/vim-plug.git' s:mng_repo_dir
    endif
    execute 'set runtimepath^=' . s:mng_repo_dir
endif

" setting plugins
let s:mng_plug_dir = expand('$XDG_CONFIG_HOME/nvim/plug/plugins')
call plug#begin(s:mng_plug_dir)
" colorscheme
Plug 'overcache/NeoSolarized'
Plug 'junegunn/seoul256.vim'
Plug 'NLKNguyen/papercolor-theme'
"  status line
Plug 'itchyny/lightline.vim'
" key bind
Plug 'houtsnip/vim-emacscommandline'
" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" explore
Plug 'Shougo/defx.nvim'
" search
Plug 'Shougo/denite.nvim'
" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" To check if plugged
function! IsPlugged(name)
    if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
        return 1
    else
        return 0
    endif
endfunction
