imap fd <ESC>

let mapleader = " "

nmap <Tab> ==

""" Files
nmap <Leader>fs :w<CR>
nmap <Leader>ff :CtrlP<CR>
nmap <Leader>fe :find 
nmap <Leader>fd :find ~/.config/nvim/init.vim<CR>
nmap <Leader>fr :source %<CR>

""" Project level ops
nmap <Leader>pf :CtrlP<CR>
nmap <Leader>ps :grep 
nmap <Leader>pq :CtrlPQuickFix<CR> 
nmap <Leader>pa :args `git ls-files`<CR>:argdo 
nmap <Leader>pr :args `git ls-files`<CR>:argdo %s/

""" Lists
nmap <Leader>en :lnext<CR>
nmap <Leader>ep :lprev<CR>

""" Jumps
nmap <Leader>j= gg=G<C-o>:echo "Indented buffer"<CR>
nmap <Leader>jp <C-o>
nmap <Leader>jn <C-i>
nmap <Leader>jt :tag 
nmap <Leader>ji :CtrlPTag<CR>

""" Buffers
nmap <Leader>bb :CtrlPBuffer<CR>
nmap <Leader>bd :bdelete<CR>
nmap <Leader>bs :tabnew __scratch__<CR>

""" Windows
nmap <Leader>w <C-w>
nmap <C-w>d <C-w>c
nmap <C-w>m <C-w>o

""" Terminal
nmap <Leader>xx :term<CR>
nmap <Leader>xt :tabnew<CR>:term<CR>
tnoremap fd <C-\><C-n>
tnoremap jk <C-\><C-n>:tabprev<CR>

""" Tabs
nmap <Leader>tn :tabnext<CR>
nmap <Leader>tp :tabprev<CR>
nmap <Leader>to :tabnew<CR>
nmap <Leader>tc :tabclose<CR>
nmap <Leader>tw <C-w>T

""" Git
nmap <Leader>ga :!git add %<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gs :Magit<CR>

""" Utility
nmap YY ggyG<C-o><C-o> " Copy whole buffer without losing my place

""" System / Vim management
nmap <Leader>spi :PlugInstall<CR> 
nmap <Leader>spu :PlugUpdate<CR> 
nmap <Leader>spg :PlugUpgrade<CR> 
nmap <Leader>sps :PlugStatus<CR>
nmap <Leader>spc :PlugClean<CR>

""" Writing
nmap <Leader>rm :Goyo<CR>
nmap <Leader>rww :Wordy 
nmap <Leader>rwn :NextWordy<CR>
nmap <Leader>rwp :PrevWordy<CR>
nmap <Leader>rwo :NoWordy<CR>

""" Linting
nmap [a <Plug>(ale_previous_wrap)
nmap ]a <Plug>(ale_next_wrap)

""" Building
nmap <Leader>m :make 
