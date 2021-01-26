" let $FZF_DEFAULT_COMMAND='fd -H'
let $FZF_DEFAULT_COMMAND='rg --ignore-case --files --hidden'
let $FZF_DEFAULT_OPTS='--reverse --inline-info'
map <F5> :Files! ~<cr>
map <F6> :Files! .<cr>
map <F7> :Lines!<cr>
map <F8> :Rg!<cr>
