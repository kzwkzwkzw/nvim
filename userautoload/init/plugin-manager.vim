
" setting dein
let s:dein_repo_dir = expand('$XDG_CONFIG_HOME/nvim/dein/repo')
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" setting plugins
"let g:dein#install_log_filename = expand('$XDG_CONFIG_HOME/nvim/dein/dein.log')
let s:dein_plug_dir = expand('$XDG_CONFIG_HOME/nvim/dein/plugins')
if dein#load_state(s:dein_plug_dir)
    call dein#begin(s:dein_plug_dir)

    " setting toml file
    let s:dein_toml_dir = expand('$XDG_CONFIG_HOME/nvim/toml')
    let s:dein_toml_file = '/dein.toml'
    if !isdirectory(s:dein_toml_dir)
        call mkdir(s:dein_toml_dir, 'p')
        execute 'redir > ' . s:dein_toml_dir . s:dein_toml_file
    endif
    let s:toml = s:dein_toml_dir . s:dein_toml_file
    call dein#load_toml(s:toml, {'lazy': 0})

    " end settings
    call dein#end()
    call dein#save_state()
endif

" installing plugins
if dein#check_install()
    call dein#install()
endif

" uninstalling plugins
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endif

