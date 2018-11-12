augroup autofmt
  autocmd!
  """ Auto format python on save
  autocmd BufWritePre *.py Neoformat
  """ Auto format rust on save
  autocmd BufWritePre *.rs Neoformat
augroup END

""" Terminal stuff
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * startinsert
autocmd BufEnter,BufWinEnter,WinEnter term://* startinsert

""" Rust CTAGS
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
