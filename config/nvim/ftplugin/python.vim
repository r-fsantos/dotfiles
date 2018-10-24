augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat python isort
  autocmd BufWritePre * Neoformat python yapf
augroup END
