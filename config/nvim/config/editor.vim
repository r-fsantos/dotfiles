""" General Vim Editor configuration

""" netrw
" Remove directories even if they aren't empty
let g:netrw_localrmdir='rm -r'

""" Tab size
set tabstop=4     " A tab is 4 spaces
set expandtab     " Always uses spaces instead of tabs
set softtabstop=4 " Insert 4 spaces when tab is pressed
set shiftwidth=4  " An indent is 4 spaces
set shiftround    " Round indent to nearest shiftwidth multiple
set smartindent   " Do intelligent indentation based on programming symbols like {

""" Formatting options
set textwidth=80      " 80 Column text width
set formatoptions+=ro " Auto insert comment character when making a new line
set formatoptions+=q  " Allow formatting of comments with gq
set formatoptions+=n  " recognize numbered lists
set formatoptions-=t  " No visual wrapping
set nowrap

 
""" Line numbers
set number

""" Enable mouse support
set mouse=a

""" Keep buffers open in background
set hidden

""" Ripgrep with vimgrep
if executable("rg")
    set grepprg=rg\ --vimgrep
endif

""" System clipboard
set clipboard+=unnamedplus

""" Let find search from pwd
set path=$PWD/**

""" Live preview substitution
set inccommand=nosplit

""" Intuitive backspacing in insert mode
set backspace=indent,eol,start

""" Backup / Swap
" Backup and swap directories
" Deliberate double slash: it makes the backup/swap take into account the full
" path
set backupdir=$HOME/.vim_backup//
set directory=$HOME/.vim_swap//

""" Completion
set completeopt-=preview " Don't show completion preview

""" Auto read files from disk when changed
set autoread                                                                                                                                                                                    
au CursorHold * checktime  

""" Open big split for file with V in netrw
let g:netrw_altv=1

""" Tagfiles
set tags=.tags,tags

set encoding=utf-8
