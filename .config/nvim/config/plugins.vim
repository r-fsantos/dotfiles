call plug#begin('~/.vim-plugged')
""" Fuzzy finding
Plug 'ctrlpvim/ctrlp.vim'

""" Tpope general improvements
Plug 'tpope/vim-vinegar'    " Netrw improvements
Plug 'tpope/vim-commentary' " Commenting code
Plug 'tpope/vim-surround'   " Surrounding of text
Plug 'tpope/vim-unimpaired' " Useful navigation bindings for lists
Plug 'tpope/vim-endwise'    " Add 'end' in ruby and bash scripts smartly
Plug 'tpope/vim-sleuth'     " Set tabwidth etc based on filetype
Plug 'tpope/vim-eunuch'     " Useful commands like Rename, Delete, Move, SudoWrite
Plug 'tpope/vim-abolish'    " Better abbreviations and Subvert is like fancy

""" Language Support 
Plug 'PProvost/vim-ps1'       " I write powershell scripts
Plug 'hashivim/vim-terraform' " Terraform support

""" Editor improvements
Plug 'jiangmiao/auto-pairs' " Auto closing of pairs
Plug 'alvan/vim-closetag'   " Close (X)HTML tags

""" Linting
Plug 'w0rp/ale' " Code linting

""" IDE-esque support for various languages
Plug 'sbdchd/neoformat'              " Format various sources which have a supported formatter
Plug 'fatih/vim-go', { 'for': 'go' } " Better go support
Plug 'pangloss/vim-javascript'       " Better Javascript

""" Themes
Plug 'altercation/vim-colors-solarized', {'as': 'solarized'}

""" Easy alignment
Plug 'junegunn/vim-easy-align'

""" Writing
Plug 'junegunn/goyo.vim'      " Distraction free writing like writeroom-mode
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:pencil#autoformat = 0      " 0=disable, 1=enable (def)

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

if executable("fd")
     let g:ctrlp_user_command = 'fd --type f --hidden --follow --exclude .git'
end
