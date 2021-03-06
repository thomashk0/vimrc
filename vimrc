" vim: set sw=4 ts=4 sts=4 tw=80 foldmarker={,} foldlevel=0 foldmethod=marker:
" ============================================================================ "
"   .vimrc
"
"   Author: Thomas Hiscock
"   Mail:   thomashk0@gmx.com
" ============================================================================ "

" User configuration handling {
    let g:use_bepo_keyboard = 0

    " User can override default variables by creating a .vimrc.local in the
    " directory from which vim is run
    try
        source ~/.vimrc.local
    catch
    endtry

    if !exists("g:use_bepo_keyboard")
      let g:use_bepo_keyboard = 0
    endif

    if !exists("g:enable_cpp_plugins")
      let g:enable_cpp_plugins = 0
    endif
" }
" Editor Basic Options {
    "set autoread           " Autoreload file while editing
    set encoding=utf-8
    set fileencoding=utf-8
    set ffs=unix,dos,mac

    set nobackup            " No backup and swap files
    set nowb
    set noswapfile

    " Supposed to fix key latency issues with tmux
    set timeoutlen=1000 ttimeoutlen=0
    set showcmd             " Print current command
    set nocp                " Vi compatibility disabled
    set mouse=a             " Mouse active in vim shell version
    set so=7                " 7 line bellow vertical moves
    set nomousehide         " Always show cursor
    set wildmenu            " Completion menu
    set wildignore =*.o,*.r,*.so,*.sl,*.tar,*.tgz
    set wildmode=list:longest,full
    set ruler               " Show current position (in line and col)
    set cmdheight=1
    set hid                 " Ne pas afficher les buffer que l'on a fermé
    set ignorecase
    set smartcase
    set hlsearch            " Highlight search results
    set incsearch           " Search while typing the search string
    " set lazyredraw
    set magic
    set showmatch           " Show matching brackets, parenthesis ect...
    set mat=2
    set noerrorbells        " No bell !
    set novisualbell
    set tm=500
    "set formatprg=par\ -w80jr " Paragraph formating with par, give better
                               " results but require par installed
    set spelllang=en        " Spellchecking : EN
    set spell
    set fo+=o               " Automatically insert a comment while passing in
                            " insert mode
    set fo-=r               " Do not automatically insert comment when pressing
                            " <ENTER> in insert mode
    " Highlight some special chars like tabs, trailing whitespaces
    set list
    set listchars=tab:›-,trail:.,extends:#,nbsp:.
    set tags+=./.tags;/,~/.vimtags
" }
" Vundle plugin handling {
    " Vundle manage all plugins, configure the next line to point Vundle
    " install directory
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin()
    source ~/.vimrc.bundles
    call vundle#end()
    " Must be called after plugin are loaded otherwise causes some trouble with
    " ultisnips
    filetype on
    filetype indent on
    filetype plugin on

" }
" User Interface Look {
    set cursorline          " Highlight the current line
    set t_Co=256            " 256 color mode
    syntax enable
    set background=dark
    colorscheme kolor
    set number
    set foldmethod =syntax " Automatic folding
    if has('gui_running')
        " Make gui looks like the shell, remove menu, side scroller ect...
        set go=agit " mTrlLe
        set guicursor=a:blinkon0
        set antialias
        set guifont=Monospace\ 9
        " set guifont=Consolas\ 11
    endif

    " Some color customisations
    hi clear SpellBad
    hi SpellBad cterm=underline
    " set tw=80              " Max line width 80 : Disabled, cursor column is a
                             " better indicator
    set cc=80               " Show cursor column

    set expandtab           " Replace tabs with spaces
    set tabstop=2           " Tabulation width
    set shiftwidth=2
    set softtabstop=2
    set smarttab
    set smartindent

    "set lbr                " Break when a line goes over tw chars
    "set wrap               " Show long lines on multiple lines
    set nowrap

    set laststatus=2        " Always show status bar
" }
" Keyboard mappings {
    set backspace=indent,eol,start
    set whichwrap+=<,>,h,l

    " Leader is set as space
    let mapleader = " "

    " File modification
    nmap <leader>s :w!<CR>
    nmap <leader>q :q!<CR>

    " CTRL-P bindings
    nmap <leader>rr :CtrlP<CR>
    nmap <leader>ra :CtrlPBuffer<CR>
    nmap <leader>ru :CtrlPMRUFiles<CR>
    nmap <leader>ri :CtrlPTag<CR>

    nmap <leader>en :cnext<CR>
    nmap <leader>ep :cprevious<CR>
    nmap <leader>el :cl<CR>

    nmap <leader>gs :Gstatus
    nmap <leader>gcc :Gcommit
    nmap <leader>gca :Gcommit --amend

    nmap <leader>gg :YcmCompleter GoToDefinition<CR>
    nmap <leader>gf :YcmCompleter FixIt<CR>

    " map <leader>u :redo<CR>
    " Tab switching
    nmap <leader>tn :tabnew<CR>
    nmap <leader>to :tabonly<CR>
    nmap <leader>tc :tabclose<CR>
    nmap <leader>tm :tabmove<CR>
    nmap <leader>tl :tabnext<CR>
    nmap <leader>tp :tabprevious<cr>

    nmap <leader>fd :e ~/.vimrc<CR>

    " Completion bindings
    " See :help inc-completion
    imap ,o <C-X><C-O>
    imap ,l <C-X><C-L>
    imap ,t <C-X><C-]>
    imap ,p <C-X><C-P>
    imap ,f <C-X><C-F>
    imap ,n <C-N>
    imap ,a <C-P>

    " Close completion win
    imap ,, <C-E>

    vmap ,f :ClangFormat<CR>

    nmap <F2> :TagbarToggle<CR>
    nmap <F3> :call DeleteTrailingWS()<CR>
    imap <F5> FIXME(ThomasH, <C-R>=strftime("%d %b %Y")<CR>):
    nmap <F6> :!ctags -R .<CR>
    nmap <F7> <C-]>
    nmap <S-F7> <C-O>
    nmap <leader>n <C-]>
    nmap <leader>a <C-O>
    " nmap <leader>e <C-O>


    if (g:use_bepo_keyboard == 1)
        source ~/.vimrc.bepo
    endif
" }
" Extra Functions {
    func! DeleteTrailingWS()
        exe "normal mz"
        %s/\s\+$//ge
        exe "normal `z"
    endfunc
" }
" Language Tweaks {
    " Reckognize doxygen comments in vhdl
    function! SetupVHDLConfig()
        set comments^=:--!
        set comments^=:--
        set foldmethod=marker
        " Fold Doxygen groups
        set foldmarker=@{,@}
    endfunction

    autocmd FileType vhdl call SetupVHDLConfig()
" }
" Plugins{
    " CTRL-P (Fuzzy finder) {
        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/](\.git|\.hg|\.svn|dist)$',
          \ 'file': '\v\.(bin|pyc|o)$',
          \ }
        let g:ctrlp_extensions = ['buffertag', 'tag', 'line']
    "}
    " vim-airline {
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_detect_modified=1
    " }
    " Python Mode {
        " Set which python version can be used values are `python`, `python3`,
        " `disable`
        let g:pymode_python = 'python'

        " We do not want to run python scripts from vim
        let g:pymode_run = 0
        let g:pymode_breakpoint = 0

        "Linting
        " Do not open quickfix window automatically
        let g:pymode_lint_cwindow = 0
    " }
    " Snipmate {
        if has('nvim')
            let g:UltiSnipsUsePythonVersion = 3
            let g:pymode_python = 'python3'
        else
            let g:UltiSnipsUsePythonVersion = 2
        endif
        let g:UltiSnipsExpandTrigger="<C-a>"
        let g:UltiSnipsJumpForwardTrigger="<C-b>"
        let g:UltiSnipsJumpBackwardTrigger="<C-z>"
        let g:UltiSnipsEditSplit="vertical"
    " }
    " YCM {
        let g:ycm_server_python_interpreter="/usr/bin/python3"
        let g:ycm_global_ycm_extra_conf="~/.ycm_extra_conf.py"
    " }
    " Clang-format {
        let g:clang_format#code_style = "mozilla"
        let g:clang_format#style_options = {
            \ "AlignAfterOpenBracket": "AlwaysBreak",
            \ "AlignTrailingComments": "false"}

    " }
" }
