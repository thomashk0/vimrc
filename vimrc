" vim: set sw=4 ts=4 sts=4 tw=80 foldmarker={,} foldlevel=0 foldmethod=marker nospell:
" =========================================================================== "
"       Vimrc
"
"       Author: Thomas Hiscock
"       Mail: hiscockt@minatec.inpg.fr
" =========================================================================== "

" Editor {
    "set autoread           " Autoreload file while editing
    set encoding=utf-8
    set fileencoding=utf-8
    set ffs=unix,dos,mac

    set nobackup            " No backup and swap files
    set nowb
    set noswapfile

    set showcmd             " Print current command
    set  nocp               " Vi compatibility disabled
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
    set spelllang=fr        " Spellchecking : FR
    "set nospell
    set fo+=o               " Automatically insert a comment while passing in
                            " insert mode
    set fo-=r               " Do not automatically insert comment when pressing
                            " <ENTER> in insert mode
    " Highlight some special chars like tabs, trailing whitespaces
    set list
    set listchars=tab:›-,trail:.,extends:#,nbsp:.
    set tags+=./.tags;/,~/.vimtags
" }
" Bundles {
    " Vundle manage all plugins, configure the next line to point vundle
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
" UI Look {
    set cursorline          " Highlight the current line
    set t_Co=256            " 256 color mode
    syntax enable
    set nu
    set foldmethod =syntax " Automatic folding
    if has('gui_running')
       set go-=m            " Make gui looks like the shell, remove menu,
       set go-=T            " side scroller ect...
       set go-=r
       set go-=l
       set go-=rL
       set go-=e
       set guicursor=a:blinkon0
       set background=dark
       colorscheme kolor
       set antialias
       " set guifont=Monospace\ 9
       set guifont=Consolas\ 11
    else
        if &term=="xterm-256color"
            set background=dark
            "let g:solarized_termcolors=256
            let g:solarized_underline=0
            colorscheme solarized
        else
            set background=dark
            colorscheme kolor
            " colorscheme bubblegum
        endif
        "colorscheme hybrid
    endif

    " Some color customisations
    hi clear SpellBad
    hi SpellBad cterm=underline
    "hi ColorColumn ctermbg=236
    "hi CursorLine ctermbg=236 cterm=NONE

    " set tw=80              " Max line width 78 : Disabled, cursor column is a
                             " better indicator
    set cc=79               " Show cursor column

    set expandtab           " Replace tabs with spaces
    set tabstop=4           " Tabulation width
    set shiftwidth=4
    set softtabstop=4
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

    " CTRLP bindings
    nmap <leader>rr :CtrlP<CR>
    nmap <leader>ra :CtrlPBuffer<CR>
    nmap <leader>ru :CtrlPMRUFiles<CR>
    nmap <leader>ri :CtrlPTag<CR>

    nmap <leader>gs :Gstatus
    nmap <leader>gcc :Gcommit
    nmap <leader>gca :Gcommit --amend

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

    nmap <F2> :help 
    nmap <F6> :!ctags -R .<CR>
    nmap <F3> :call DeleteTrailingWS()<CR>
    nmap <F7> <C-]>
    nmap <S-F7> <C-O>
    nmap <leader>n <C-]>
    nmap <leader>a <C-O>
    " nmap <leader>e <C-O>

    let g:use_bepo_keyboard = 1
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
" Plugins{
    " CTRL-P (Fuzzy finder) {
        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/](\.git|\.hg|\.svn|dist)$',
          \ 'file': '\v\.(bin|pyc|o)$',
          \ }
    "}
    " vim-airline {
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_detect_modified=1
    " }
    " Python Mode {
        let g:pymode_rope = 1
        let g:pymode_rope_goto_definition_bind = '<leader>rg'

        " Documentation
        let g:pymode_doc = 1
        let g:pymode_doc_key = 'K'

        "Linting
        let g:pymode_lint = 1
        let g:pymode_lint_checker = "pyflakes,pep8,mccabe"
        let g:pymode_lint_ignore = "W0"
        let g:pyflakes_use_quickfix = 0 " Ne pas utiliser quickfix

        " Coloration syntaxique
        let g:pymode_syntax = 1
        let g:pymode_syntax_all = 1
        let g:pymode_syntax_indent_errors = g:pymode_syntax_all
        let g:pymode_syntax_space_errors = g:pymode_syntax_all
        " Don't autofold code
        "let g:pymode_folding = 1

        let g:pymode_indent = 1
    " }
    " Snipmate {
        let g:UltiSnipsUsePythonVersion = 2
        let g:UltiSnipsExpandTrigger="<C-a>"
        let g:UltiSnipsJumpForwardTrigger="<C-b>"
        let g:UltiSnipsJumpBackwardTrigger="<C-z>"
        let g:UltiSnipsEditSplit="vertical"
    " }
" }
