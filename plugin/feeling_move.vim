if exists('g:loaded_feeling_move')
  finish
endif
let g:loaded_feeling_move = v:true

nnoremap <Plug>(feeling_move_up)              :<C-u>call <SID>move('up', v:false)<CR>
nnoremap <Plug>(feeling_move_up_half)         :<C-u>call <SID>move('up', v:true)<CR>
nnoremap <Plug>(feeling_move_down)            :<C-u>call <SID>move('down', v:false)<CR>
nnoremap <Plug>(feeling_move_down_half)       :<C-u>call <SID>move('down', v:true)<CR>
nnoremap <Plug>(feeling_move_left)            :<C-u>call <SID>move('left', v:false)<CR>
nnoremap <Plug>(feeling_move_left_half)       :<C-u>call <SID>move('left', v:true)<CR>
nnoremap <Plug>(feeling_move_right)           :<C-u>call <SID>move('right', v:false)<CR>
nnoremap <Plug>(feeling_move_right_half)      :<C-u>call <SID>move('right', v:true)<CR>
nnoremap <Plug>(feeling_move_up_left)         :<C-u>call <SID>move('up_left', v:false)<CR>
nnoremap <Plug>(feeling_move_up_left_half)    :<C-u>call <SID>move('up_left', v:true)<CR>
nnoremap <Plug>(feeling_move_up_right)        :<C-u>call <SID>move('up_right', v:false)<CR>
nnoremap <Plug>(feeling_move_up_right_half)   :<C-u>call <SID>move('up_right', v:true)<CR>
nnoremap <Plug>(feeling_move_down_left)       :<C-u>call <SID>move('down_left', v:false)<CR>
nnoremap <Plug>(feeling_move_down_left_half)  :<C-u>call <SID>move('down_left', v:true)<CR>
nnoremap <Plug>(feeling_move_down_right)      :<C-u>call <SID>move('down_right', v:false)<CR>
nnoremap <Plug>(feeling_move_down_right_half) :<C-u>call <SID>move('down_right', v:true)<CR>

function! s:move(direction, is_half)
  let pos = feeling_move#get_pos(a:direction, a:is_half)
  call cursor(pos[0], pos[1])
endfunction

