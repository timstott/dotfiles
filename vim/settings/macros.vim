" Puts out value of a variable below current line
" pt = put - a handy mnemonic
" puts "troublesome_variable: #{troublesome_variable}"
nnoremap <Leader>pt  "xyiwoputs ": #{}"<esc>F:"xPf{"xp
nnoremap <Leader>pit "xyiwoputs ": #{.inspect}"<esc>F:"xPf{"xp
vnoremap <Leader>pt  "xyoputs ": #{}"<esc>F:"xPf{"xp
vnoremap <Leader>pit "xyoputs ": #{.inspect}"<esc>F:"xPf{"xp
