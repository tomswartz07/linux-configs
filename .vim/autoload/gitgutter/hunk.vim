function! gitgutter#hunk#set_hunks(bufnr, hunks) abort
  call gitgutter#utility#setbufvar(a:bufnr, 'hunks', a:hunks)
  call s:reset_summary(a:bufnr)
endfunction

function! gitgutter#hunk#hunks(bufnr) abort
  return gitgutter#utility#getbufvar(a:bufnr, 'hunks', [])
endfunction

function! gitgutter#hunk#reset(bufnr) abort
  call gitgutter#utility#setbufvar(a:bufnr, 'hunks', [])
  call s:reset_summary(a:bufnr)
endfunction


function! gitgutter#hunk#summary(bufnr) abort
  return gitgutter#utility#getbufvar(a:bufnr, 'summary', [0,0,0])
endfunction

function! s:reset_summary(bufnr) abort
  call gitgutter#utility#setbufvar(a:bufnr, 'summary', [0,0,0])
endfunction

function! gitgutter#hunk#increment_lines_added(bufnr, count) abort
  let summary = gitgutter#hunk#summary(a:bufnr)
  let summary[0] += a:count
  call gitgutter#utility#setbufvar(a:bufnr, 'summary', summary)
endfunction

function! gitgutter#hunk#increment_lines_modified(bufnr, count) abort
  let summary = gitgutter#hunk#summary(a:bufnr)
  let summary[1] += a:count
  call gitgutter#utility#setbufvar(a:bufnr, 'summary', summary)
endfunction

function! gitgutter#hunk#increment_lines_removed(bufnr, count) abort
  let summary = gitgutter#hunk#summary(a:bufnr)
  let summary[2] += a:count
  call gitgutter#utility#setbufvar(a:bufnr, 'summary', summary)
endfunction


function! gitgutter#hunk#next_hunk(count) abort
  let bufnr = bufnr('')
  if gitgutter#utility#is_active(bufnr)
    let current_line = line('.')
    let hunk_count = 0
    for hunk in gitgutter#hunk#hunks(bufnr)
      if hunk[2] > current_line
        let hunk_count += 1
        if hunk_count == a:count
          execute 'normal!' hunk[2] . 'Gzv'
          return
        endif
      endif
    endfor
    call gitgutter#utility#warn('No more hunks')
  endif
endfunction

function! gitgutter#hunk#prev_hunk(count) abort
  let bufnr = bufnr('')
  if gitgutter#utility#is_active(bufnr)
    let current_line = line('.')
    let hunk_count = 0
    for hunk in reverse(copy(gitgutter#hunk#hunks(bufnr)))
      if hunk[2] < current_line
        let hunk_count += 1
        if hunk_count == a:count
          let target = hunk[2] == 0 ? 1 : hunk[2]
          execute 'normal!' target . 'Gzv'
          return
        endif
      endif
    endfor
    call gitgutter#utility#warn('No previous hunks')
  endif
endfunction

" Returns the hunk the cursor is currently in or an empty list if the cursor
" isn't in a hunk.
function! s:current_hunk() abort
  let bufnr = bufnr('')
  let current_hunk = []

  for hunk in gitgutter#hunk#hunks(bufnr)
    if gitgutter#hunk#cursor_in_hunk(hunk)
      let current_hunk = hunk
      break
    endif
  endfor

  return current_hunk
endfunction

" Returns truthy if the cursor is in two hunks (which can only happen if the
" cursor is on the first line and lines above have been deleted and lines
" immediately below have been deleted) or falsey otherwise.
function! s:cursor_in_two_hunks()
  let hunks = gitgutter#hunk#hunks(bufnr(''))

  if line('.') == 1 && len(hunks) > 1 && hunks[0][2:3] == [0, 0] && hunks[1][2:3] == [1, 0]
    return 1
  endif

  return 0
endfunction

" A line can be in 0 or 1 hunks, with the following exception: when the first
" line(s) of a file has been deleted, and the new second line (and
" optionally below) has been deleted, the new first line is in two hunks.
function! gitgutter#hunk#cursor_in_hunk(hunk) abort
  let current_line = line('.')

  if current_line == 1 && a:hunk[2] == 0
    return 1
  endif

  if current_line >= a:hunk[2] && current_line < a:hunk[2] + (a:hunk[3] == 0 ? 1 : a:hunk[3])
    return 1
  endif

  return 0
endfunction


function! gitgutter#hunk#in_hunk(lnum)
  " Hunks are sorted in the order they appear in the buffer.
  for hunk in gitgutter#hunk#hunks(bufnr(''))
    " if in a hunk on first line of buffer
    if a:lnum == 1 && hunk[2] == 0
      return 1
    endif

    " if in a hunk generally
    if a:lnum >= hunk[2] && a:lnum < hunk[2] + (hunk[3] == 0 ? 1 : hunk[3])
      return 1
    endif

    " if hunk starts after the given line
    if a:lnum < hunk[2]
      return 0
    endif
  endfor

  return 0
endfunction


function! gitgutter#hunk#text_object(inner) abort
  let hunk = s:current_hunk()

  if empty(hunk)
    return
  endif

  let [first_line, last_line] = [hunk[2], hunk[2] + hunk[3] - 1]

  if ! a:inner
    let lnum = last_line
    let eof = line('$')
    while lnum < eof && empty(getline(lnum + 1))
      let lnum +=1
    endwhile
    let last_line = lnum
  endif

  execute 'normal! 'first_line.'GV'.last_line.'G'
endfunction


function! gitgutter#hunk#stage(...) abort
  if a:0 && (a:1 != 1 || a:2 != line('$'))
    call s:hunk_op(function('s:stage'), a:1, a:2)
  else
    call s:hunk_op(function('s:stage'))
  endif
  silent! call repeat#set("\<Plug>GitGutterStageHunk", -1)
endfunction

function! gitgutter#hunk#undo() abort
  call s:hunk_op(function('s:undo'))
  silent! call repeat#set("\<Plug>GitGutterUndoHunk", -1)
endfunction

function! gitgutter#hunk#preview() abort
  call s:hunk_op(function('s:preview'))
  silent! call repeat#set("\<Plug>GitGutterPreviewHunk", -1)
endfunction


function! s:hunk_op(op, ...)
  let bufnr = bufnr('')

  if &previewwindow
    if string(a:op) =~ '_stage'
      " combine hunk-body in preview window with updated hunk-header
      let hunk_body = getline(1, '$')

      let [removed, added] = [0, 0]
      for line in hunk_body
        if line[0] == '-'
          let removed += 1
        elseif line[0] == '+'
          let added += 1
        endif
      endfor

      let hunk_header = b:hunk_header
      " from count
      let hunk_header[4] = substitute(hunk_header[4], '\(-\d\+\)\(,\d\+\)\?', '\=submatch(1).",".removed', '')
      " to count
      let hunk_header[4] = substitute(hunk_header[4], '\(+\d\+\)\(,\d\+\)\?', '\=submatch(1).",".added', '')

      let hunk_diff = join(hunk_header + hunk_body, "\n")."\n"

      wincmd p
      pclose
      call s:stage(hunk_diff)
    endif

    return
  endif

  if gitgutter#utility#is_active(bufnr)
    " Get a (synchronous) diff.
    let [async, g:gitgutter_async] = [g:gitgutter_async, 0]
    let diff = gitgutter#diff#run_diff(bufnr, 'index', 1)
    let g:gitgutter_async = async

    call gitgutter#hunk#set_hunks(bufnr, gitgutter#diff#parse_diff(diff))

    if empty(s:current_hunk())
      call gitgutter#utility#warn('cursor is not in a hunk')
    elseif s:cursor_in_two_hunks()
      let choice = input('Choose hunk: upper or lower (u/l)? ')
      " Clear input
      normal! :<ESC>
      if choice =~ 'u'
        call a:op(gitgutter#diff#hunk_diff(bufnr, diff, 0))
      elseif choice =~ 'l'
        call a:op(gitgutter#diff#hunk_diff(bufnr, diff, 1))
      else
        call gitgutter#utility#warn('did not recognise your choice')
      endif
    else
      let hunk_diff = gitgutter#diff#hunk_diff(bufnr, diff)

      if a:0
        let hunk_first_line = s:current_hunk()[2]
        let hunk_diff = s:part_of_diff(hunk_diff, a:1-hunk_first_line, a:2-hunk_first_line)
      endif

      call a:op(hunk_diff)
    endif
  endif
endfunction


function! s:stage(hunk_diff)
  let bufnr = bufnr('')
  let diff = s:adjust_header(bufnr, a:hunk_diff)
  " Apply patch to index.
  call gitgutter#utility#system(
        \ gitgutter#utility#cd_cmd(bufnr, g:gitgutter_git_executable.' '.g:gitgutter_git_args.' apply --cached --unidiff-zero - '),
        \ diff)
  if v:shell_error
    call gitgutter#utility#warn('patch does not apply')
  endif

  " Refresh gitgutter's view of buffer.
  call gitgutter#process_buffer(bufnr, 1)
endfunction


function! s:undo(hunk_diff)
  " Apply reverse patch to buffer.
  let hunk  = gitgutter#diff#parse_hunk(split(a:hunk_diff, '\n')[4])
  let lines = map(split(a:hunk_diff, '\n')[5:], 'v:val[1:]')
  let lnum  = hunk[2]
  let added_only   = hunk[1] == 0 && hunk[3]  > 0
  let removed_only = hunk[1]  > 0 && hunk[3] == 0

  if removed_only
    call append(lnum, lines)
  elseif added_only
    execute lnum .','. (lnum+len(lines)-1) .'d _'
  else
    call append(lnum-1, lines[0:hunk[1]])
    execute (lnum+hunk[1]) .','. (lnum+hunk[1]+hunk[3]) .'d _'
  endif
endfunction


function! s:preview(hunk_diff)
  let lines = split(a:hunk_diff, '\n')
  let header = lines[0:4]
  let body = lines[5:]

  let body_length = len(body)
  let previewheight = min([body_length, &previewheight])

  silent! wincmd P
  if !&previewwindow
    noautocmd execute g:gitgutter_preview_win_location previewheight 'new'
    set previewwindow
  else
    execute 'resize' previewheight
  endif

  let b:hunk_header = header

  setlocal noreadonly modifiable filetype=diff buftype=nofile bufhidden=delete noswapfile
  execute "%delete_"
  call setline(1, body)
  normal! gg

  noautocmd wincmd p
endfunction


" Returns a new hunk diff using the specified lines from the given one.
" Assumes all lines are additions.
" a:first, a:last - 0-based indexes into the body of the hunk.
function! s:part_of_diff(hunk_diff, first, last)
  let diff_lines = split(a:hunk_diff, '\n', 1)

  " adjust 'to' line count in header
  let diff_lines[4] = substitute(diff_lines[4], '\(+\d\+\)\(,\d\+\)\?', '\=submatch(1).",".(a:last-a:first+1)', '')

  return join(diff_lines[0:4] + diff_lines[5+a:first:5+a:last], "\n")."\n"
endfunction


function! s:adjust_header(bufnr, hunk_diff)
  let filepath = gitgutter#utility#repo_path(a:bufnr, 0)
  return s:adjust_hunk_summary(s:fix_file_references(filepath, a:hunk_diff))
endfunction


" Replaces references to temp files with the actual file.
function! s:fix_file_references(filepath, hunk_diff)
  let lines = split(a:hunk_diff, '\n')

  let left_prefix  = matchstr(lines[2], '[abciow12]').'/'
  let right_prefix = matchstr(lines[3], '[abciow12]').'/'
  let quote        = lines[0][11] == '"' ? '"' : ''

  let left_file  = quote.left_prefix.a:filepath.quote
  let right_file = quote.right_prefix.a:filepath.quote

  let lines[0] = 'diff --git '.left_file.' '.right_file
  let lines[2] = '--- '.left_file
  let lines[3] = '+++ '.right_file

  return join(lines, "\n")."\n"
endfunction

if $VIM_GITGUTTER_TEST
  function! gitgutter#hunk#fix_file_references(filepath, hunk_diff)
    return s:fix_file_references(a:filepath, a:hunk_diff)
  endfunction
endif


function! s:adjust_hunk_summary(hunk_diff) abort
  let line_adjustment = s:line_adjustment_for_current_hunk()
  let diff = split(a:hunk_diff, '\n', 1)
  let diff[4] = substitute(diff[4], '+\@<=\(\d\+\)', '\=submatch(1)+line_adjustment', '')
  return join(diff, "\n")
endfunction


" Returns the number of lines the current hunk is offset from where it would
" be if any changes above it in the file didn't exist.
function! s:line_adjustment_for_current_hunk() abort
  let bufnr = bufnr('')
  let adj = 0
  for hunk in gitgutter#hunk#hunks(bufnr)
    if gitgutter#hunk#cursor_in_hunk(hunk)
      break
    else
      let adj += hunk[1] - hunk[3]
    endif
  endfor
  return adj
endfunction

