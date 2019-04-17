let g:feeling_move#config = get(g:, 'feeling_move#config', {
      \   'offset_line': 10,
      \   'offset_col': 10
      \ })

function! feeling_move#move(direction, is_half)
  let prevpos = getcurpos()
  let nextpos = feeling_move#get_pos(prevpos, a:direction, a:is_half)

  let [prev_bufnr, prev_line, prev_col, prev_off, curswant] = prevpos
  let prev_col = prev_col + prev_off
  let [next_line, next_col] = nextpos

  let motions = []
  if next_col < prev_col
    call add(motions, printf('%sh', prev_col - next_col))
  elseif prev_col < next_col
    call add(motions, printf('%sl', next_col - prev_col))
  endif
  if next_line < prev_line
    call add(motions, printf('%sk', prev_line - next_line))
  elseif prev_line < next_line
    call add(motions, printf('%sj', next_line - prev_line))
  endif
  return join(motions, '')
endfunction

function! feeling_move#get_pos(curpos, direction, is_half)
  let is_half = get(a:000, 0)
  let offset_line = g:feeling_move#config.offset_line * (is_half ? 0.5 : 1)
  let offset_col = g:feeling_move#config.offset_col * (is_half ? 0.5 : 1)

  let [bufnr, lnum, col, off, curswant] = a:curpos

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

