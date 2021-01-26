" incsearch incsearch-fuzzy easymotion incsearch-easymotion
" combo function
function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
        \ 'converters': [incsearch#config#fuzzy#converter()],
        \ 'modules': [incsearch#config#easymotion#module()],
        \ 'keymap': {"\<CR>": '<Over>(easymotion)'},
        \ 'is_expr': 0,
        \ 'is_stay': 1
      \ }), get(a:, 1, {}))
endfunction
nnoremap <silent><expr> <F4> incsearch#go(<SID>config_easyfuzzymotion())
