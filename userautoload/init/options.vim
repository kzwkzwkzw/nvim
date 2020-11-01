" encoding
set fileencodings=utf-8,cp932,sjis,iso-2022-jp,euc-jp
set fileformats=unix,dos,mac
scriptencoding utf-8

" window
set background=dark
set notitle
set number
set relativenumber
set linespace=1
set list
set listchars=tab:>.,trail:␣
set showtabline=4
set signcolumn=yes

" command line
set laststatus=2
set cmdheight=1
set wildmenu
set wildmode=list:longest,full
set history=10000

" cursor
set whichwrap=b,s,<,>,[,],h,l
set scrolloff=7
set sidescrolloff=7
set sidescroll=1

" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" indent
set autoindent
set smartindent
set cindent
set cinoptions+=:0,g0

" file
set hidden

" buffer
set switchbuf=useopen

" search
set nowrapscan

" grep
if executable('rg')
    set grepprg=rg\ --vimgrep\ --hidden
    set grepformat=%f:%l:%c:%m
endif

" OS
set clipboard+=unnamed,unnamedplus
set mouse=a

" shell
set shellslash

" spell check
set spell
set spelllang=en,cjk

" completion
set complete+=k

" vimdiff
set diffopt=filler,context:10000

" timeout
set timeout timeoutlen=1000 ttimeoutlen=100

" update time
set updatetime=100
