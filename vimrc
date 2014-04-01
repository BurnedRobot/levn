set hlsearch
set number
colorscheme desert
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set guifont=Monospace\ 13
hi Comment ctermfg=gray guifg=gray
hi Constant ctermfg=red guifg=red
hi PreProc ctermfg=green guifg=green
hi Statement ctermfg=blue guifg=blue
hi Type ctermfg=brown guifg=brown
hi Identifier ctermfg=yellow guifg=yellow
hi Special ctermfg=cyan guifg=cyan


set nocompatible              " be iMproved
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.


" My vim config
" taglist-plus
Bundle 'taglist-plus'
" auto taglist-plus on
let Tlist_Auto_Open=0
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1

Bundle 'cscope.vim'

" OmniCppComplete
Bundle 'OmniCppComplete'
set tags+=~/.vim/tags/cpp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "__GLIBCXX_STD"]
" autoclose complete window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

Bundle 'OmniTags'
" python
Bundle 'Python-3.x-Standard-Library-Reference'

Bundle 'scrooloose/nerdtree'
"let NERDTreeWinSize=20
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"autocmd vimenter * NERDTree

set nocp
filetype plugin on
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python3 set omnifunc=python3complete#Complete
" autocmd FileType cpp set omnifunc=CppComplete#Complete
