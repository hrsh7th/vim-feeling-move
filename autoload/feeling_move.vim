let g:feeling_move = get(g:, 'feeling_move', {})
let g:feeling_move#config = get(g:feeling_move, 'config', {
      \   'offset_line': 10,
      \   'offset_col': 10
      \ })

"
" direction:
"   - 'up'
"   - 'down'
"   - 'left'
"   - 'right'
"   - 'up_left'
"   - 'up_right'
"   - 'down_left'
"   - 'down_right'
"
function! feeling_move#get_pos(direction, is_half)
  let is_half = get(a:000, 0)
  let offset_line = g:feeling_move#config.offset_line * (is_half ? 0.5 : 1)
  let offset_col = g:feeling_move#config.offset_col * (is_half ? 0.5 : 1)

  let [bufnr, lnum, col, off] = getpos('.')

  let col = col + off " for virtualedit

  let pos = [lnum, col]
  if a:direction ==# 'up'
    let pos = [lnum - offset_line, col]
  elseif a:direction ==# 'down'
    let pos = [lnum + offset_line, col]
  elseif a:direction ==# 'left'
    let pos = [lnum, col - offset_col]
  elseif a:direction ==# 'right'
    let pos = [lnum, col + offset_col]
  elseif a:direction ==# 'up_left'
    let pos = [lnum - (cos(45) * offset_line), col - (sin(45) * offset_col)]
  elseif a:direction ==# 'up_right'
    let pos = [lnum - (cos(45) * offset_line), col + (sin(45) * offset_col)]
  elseif a:direction ==# 'down_left'
    let pos = [lnum + (cos(45) * offset_line), col - (sin(45) * offset_col)]
  elseif a:direction ==# 'down_right'
    let pos = [lnum + (cos(45) * offset_line), col + (sin(45) * offset_col)]
  endif

  let pos = [
        \ min([line('$'), max([1, float2nr(pos[0])])]),
        \ max([1, float2nr(pos[1])])
        \ ]
  return pos
endfunction

