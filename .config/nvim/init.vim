source $HOME/.config/nvim/config/editor.vim
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/keys.vim
source $HOME/.config/nvim/config/autocmds.vim
" source $HOME/.config/nvim/config/myline.vim

" Highlight SCons files
autocmd BufNewFile,BufRead SCons* set syntax=python

""" Load Theme
syntax enable
filetype plugin on
set background=light
colorscheme solarized
